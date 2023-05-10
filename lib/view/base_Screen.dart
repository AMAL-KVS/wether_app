import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weter_app/model/constands.dart';
import 'package:weter_app/model/weather_model.dart';
import 'package:weter_app/widgets/button.dart';
import 'package:weter_app/widgets/text_feild.dart';

class BaseScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  const BaseScreen(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  Map? map;
  String weather = '';
  String cityName = '';
  String countryName = '';
  double windspeed = 0;
  final cityContoller = TextEditingController();
  DateTime current_date = DateTime.now();
  @override
  void initState() {
    super.initState();
    curentMessege();
    Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _getCurrentDateTime());
  }

  void _getCurrentDateTime() {
    setState(() {
      current_date = DateTime.now();
    });
  }

  String curentMessege() {
    if (current_date.hour <= 10) {
      return 'Good Moring';
    }
    if (current_date.hour >= 10 && current_date.hour <= 13) {
      return 'Good After Noon';
    }
    if (current_date.hour <= 17 && current_date.hour >= 13) {
      return 'Good evening ';
    }
    if (current_date.hour >= 17 && current_date.hour <= 24) {
      return 'Good Night';
    }
    return 'Hey Gooys';
  }

  String curentImage() {
    if (current_date.hour <= 10) {
      return kmoring;
    }
    if (current_date.hour >= 10 && current_date.hour <= 13) {
      return kmainbaground;
    }
    if (current_date.hour <= 17 && current_date.hour >= 13) {
      return kevening;
    }
    if (current_date.hour >= 17 && current_date.hour <= 24) {
      return knight;
    }
    return 'Hey Gooys';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(curentImage()))),
            width: double.infinity,
            child: ListView(children: [
              Column(children: [
                khieght20,
                khieght30,
                Text(
                  curentMessege(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${current_date.hour} : ${current_date.minute} : ${current_date.second}',
                  style: const TextStyle(
                    fontSize: 40,
                    color: kwhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormFeilldWidets(cityContoller: cityContoller),
                khieght30,
                Text(
                  cityName,
                  style: const TextStyle(color: kwhiteColor, fontSize: 20),
                ),
                Text(
                  weather,
                  style: const TextStyle(
                    fontSize: 50,
                    color: kwhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                khieght20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.latitude.toString(),
                        style:
                            const TextStyle(fontSize: 15, color: kwhiteColor)),
                    kwidth20,
                    Text(widget.longitude.toString(),
                        style:
                            const TextStyle(fontSize: 15, color: kwhiteColor))
                  ],
                ),
                Text(countryName,
                    style: const TextStyle(fontSize: 15, color: kwhiteColor)),
                Text(cityName,
                    style: const TextStyle(fontSize: 15, color: kwhiteColor)),
                Text(windspeed.toString(),
                    style: const TextStyle(fontSize: 15, color: kwhiteColor)),
                khieght30,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ButtonWidets(
                      tasZ: () async {
                        final currentWeather =
                            await WeatherModel.getCurentWether(
                                latitude: widget.latitude,
                                longitude: widget.longitude);

                        setState(() {
                          weather = currentWeather.weather.toString();
                          cityName = currentWeather.name!;
                          cityContoller.clear();
                        });
                      },
                      pic: Icons.refresh),
                  kwidth20,
                  ButtonWidets(
                      tasZ: () async {
                        final currentWeather = await WeatherModel.getCityWether(
                            cityName: cityContoller.text);
                        setState(() {
                          weather = currentWeather.weather.toString();
                          countryName = currentWeather.countryName!;
                          cityName = currentWeather.name!;
                          windspeed = currentWeather.windspeed!;
                        });
                      },
                      pic: Icons.sunny)
                ])
              ])
            ])));
  }
}
