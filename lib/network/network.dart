import 'dart:convert';

import 'package:weather_forecast/models/weather_forcast_model.dart';
import "../models/weather_forcast_model.dart";
import "../util/forecast_util.dart";
import "package:http/http.dart";

class Network {
  Future<WeatherForcastModel> getWeatherforcast({String? cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=${cityName}&appid=${Util.appId}&units=imperial";

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));

    // ignore: avoid_print
    print("URL: ${Uri.parse(Uri.encodeFull(finalUrl))}");

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("weather data: ${response.body}");
      return WeatherForcastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
