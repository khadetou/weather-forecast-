import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/widgets/forcast_card.dart';

Widget bottomView(
    {AsyncSnapshot<WeatherForcastModel>? snapshot, BuildContext? context}) {
  var forecastList = snapshot!.data!.lista;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      const SizedBox(
        height: 25,
      ),
      Text(
        "5-day weather forecast".toUpperCase(),
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        height: 170,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: forecastList!.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 8,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 160,
                child: forcastCard(snapshot: snapshot, index: index),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff9661C3), Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
