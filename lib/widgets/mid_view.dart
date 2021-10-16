import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';

Widget MidView({AsyncSnapshot<WeatherForcastModel>? snapshot}) {
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
      const Icon(
        Icons.wb_sunny,
        size: 195,
      ),
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
            Text(
              forecasList[0].weather![0].description!.toUpperCase(),
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
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
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
                  ),
                  const Icon(
                    Icons.hot_tub,
                    size: 20,
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
                  ),
                  const Icon(
                    Icons.wb_sunny,
                    size: 20,
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
