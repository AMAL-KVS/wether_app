import 'dart:convert';

import 'package:weter_app/functions/network_helper.dart';
import 'package:weter_app/model/constands.dart';

class WeatherModel {
  String? countryName;
  double? weather;
  String? name;
  double? windspeed;

  WeatherModel(
      {required this.weather,
      required this.name,
      required this.countryName,
      required this.windspeed});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      weather: json["main"]['temp'],
      name: json["name"],
      countryName: json['sys']['country'],
      windspeed: json['wind']['speed']);

  static Future<WeatherModel> getCurentWether(
      {required double latitude, required double longitude}) async {
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=$baseApi&units=metric';

    NetWorkHelper netWorkHelper = NetWorkHelper(url: baseUrl);
    final response = await netWorkHelper.getWether();
    final json = jsonDecode(response);
    return WeatherModel.fromJson(json);
  }

  static Future<WeatherModel> getCityWether({required String cityName}) async {
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${baseApi}&units=metric';
    NetWorkHelper netWorkHelper = NetWorkHelper(url: baseUrl);
    final response = await netWorkHelper.getWether();
    final json = jsonDecode(response);
    return WeatherModel.fromJson(json);
  }
}
