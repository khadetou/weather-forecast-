import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
      Center(
        child: Text(
          "${forecasList[index].dtTxt}",
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 13),
        ),
      ),
      const SizedBox(
        height: 5,
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
          ),
          const SizedBox(
            width: 3,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "${Util.Celcius(Ferenheit: forecasList[index].main!.tempMin).toStringAsFixed(0)} °C",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Icon(
                    FontAwesomeIcons.arrowCircleDown,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${Util.Celcius(Ferenheit: forecasList[index].main!.tempMax).toStringAsFixed(0)} °C",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Icon(
                    FontAwesomeIcons.arrowCircleUp,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
              Text(
                "Hum: ${forecasList[index].main!.humidity} %",
                style: const TextStyle(fontSize: 13),
              ),
              Text(
                  "Win: ${forecasList[index].wind!.speed!.toStringAsFixed(0)} mi/h",
                  style: const TextStyle(fontSize: 13)),
            ],
          )
        ],
      )
    ],
  );
}
