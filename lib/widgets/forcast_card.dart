import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_util.dart';

Widget forcastCard(
    {AsyncSnapshot<WeatherForcastModel>? snapshot, required int index}) {
  var forecasList = snapshot!.data!.lista;
  var dayOfWeek = "";
  var fullDate = Util.getFormatedDate(
    DateTime.fromMillisecondsSinceEpoch((forecasList![index].dt as int) * 1000),
  );

  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: forecasList[index].weather![0].main,
                color: Colors.pinkAccent,
                size: 45),
          )
        ],
      )
    ],
  );
}
