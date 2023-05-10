import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weter_app/model/constands.dart';
import 'package:weter_app/view/base_Screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> goToHome(context) async {
    await Future.delayed(const Duration(seconds: 1));
    final postion = await getCurrentLocation();
    final lat = postion.latitude;
    final long = postion.latitude;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => BaseScreen(latitude: lat, longitude: long)));
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are dined');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permently denied, We cannot request');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await goToHome(context);
    });
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(ksplasimae))),
            child: const Center(
                child: CircularProgressIndicator(color: kwhiteColor))));
  }
}
