import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityName {
  final String name;

  CityName({
    required this.name,

  });

  CityName copyWith({
  String?name,

}){
    return CityName(
      name:  name?? this.name,

    );
  }
}

