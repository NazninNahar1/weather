
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/model/city_name_model.dart';
import 'package:weather/model/model.dart';

class WeatherListener extends StateNotifier<CityName> {
  WeatherListener(super.state);

  void updateName(String n) {
    state = state.copyWith(name: n);
  }
}