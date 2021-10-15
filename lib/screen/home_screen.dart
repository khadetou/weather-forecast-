import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/network/network.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<WeatherForcastModel>? forecastObj;
  final String _cityName = "dakar";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forecastObj = Network().getWeatherforcast(cityName: _cityName);

    forecastObj!.then((weather) {
      print(weather.lista![0].main!.temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast"),
      ),
    );
  }
}
