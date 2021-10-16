import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';

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
    ],
  );
}
