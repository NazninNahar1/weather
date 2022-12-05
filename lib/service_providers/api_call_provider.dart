

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/service_providers/weather_listener.dart';
import '../model/city_name_model.dart';
import '../model/model.dart';


final fetchApiProvider = FutureProvider((ref){
  final cityName = ref.watch(citynameProvider).name;


  final url ="https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cb79a836674762d6ccecef7b8ae325fd&units=metric";

  return http.get(Uri.parse(url)).then((value) =>  Weather.fromJson(jsonDecode(value.body)));

});

final citynameProvider = StateNotifierProvider<WeatherListener,CityName>((ref) => WeatherListener(CityName(name: 'London')));
