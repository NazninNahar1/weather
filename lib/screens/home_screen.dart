import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../const_resouses.dart';
import '../model/model.dart';
import '../service_providers/api_call_provider.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    return ref.watch(fetchApiProvider).when(data:(data){
      return Scaffold(
        appBar: AppBar(
          title: Text('Weather Search'),
        ),

        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/img.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 100,),
              Expanded(
                child: CityInputField(),
              ),
              SizedBox(height: 100,),
              Expanded(child: Text(data.name.toString(),style: ktextstyle)),
              Expanded(child: Text('Temperature: ${data.main.temp.round()}°',style: ktextStyletemp)),
              Expanded(child: Text('Feels Like: ${data.main.feelsLike.round()}°',style: ktextstyle)),
              Expanded(child: Text(data.sys.country.toString(),style: ktextstyle)),
            ],
          ),
        ),
      );

    }, error:(Object error, StackTrace stackTrace) {
      return Scaffold(
          body: Center(child: Text(error.toString())));
    }, loading: (){
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading..'),
        ),
        body: Center(child:  CircularProgressIndicator()),

      );
    });

  }
}

class CityInputField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        onSubmitted: (value) => submitCityName(ref, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.white
          ),

          hintText: "Enter a city",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),

          ),
          suffixIcon: Icon(Icons.search,color: Colors.white,),
        ),
      ),
    );
  }

  submitCityName(WidgetRef ref, String value) {
    ref.watch(citynameProvider.notifier).updateName(value);
  }
}
