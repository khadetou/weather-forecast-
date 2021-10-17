import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_util.dart';

Widget midView({AsyncSnapshot<WeatherForcastModel>? snapshot}) {
  var forecasList = snapshot!.data!.lista;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          "$city, $country",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      Text(
        Util.getFormatedDate(
          DateTime.fromMillisecondsSinceEpoch(
              (forecasList![0].dt as int) * 1000),
        ),
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: getWeatherIcon(
            weatherDescription: forecasList[0].weather![0].main,
            color: Colors.pinkAccent,
            size: 195),
      ),
      // const Icon(
      //   FontAwesomeIcons.cloud,
      //   size: 195,
      //   color: Colors.pinkAccent,
      // ),
      // const Icon(
      //   Icons.wb_sunny,
      //   size: 195,
      // ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${Util.Celcius(Ferenheit: forecasList[0].main!.temp).toStringAsFixed(0)}°C",
              style: const TextStyle(
                fontSize: 34,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              forecasList[0].weather![0].description!.toUpperCase(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${forecasList[0].wind!.speed!.toStringAsFixed(1)} mi/h",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Icon(
                    FontAwesomeIcons.wind,
                    size: 25,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "${forecasList[0].main!.humidity!.toStringAsFixed(1)} %",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Icon(
                    FontAwesomeIcons.solidGrinBeamSweat,
                    size: 25,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "${Util.Celcius(Ferenheit: forecasList[0].main!.tempMax).toStringAsFixed(0)}°C",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Icon(
                    FontAwesomeIcons.temperatureHigh,
                    size: 25,
                    color: Colors.brown,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
