import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/network/network.dart';
import 'package:weather_forecast/widgets/textfield_view.dart';
import '../widgets/mid_view.dart';

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

    //To check if we are receiving some data or not
    // forecastObj!.then((weather) {
    //   print(weather.lista![0].main!.temp);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const TextFieldView(),
          FutureBuilder<WeatherForcastModel>(
              future: forecastObj,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForcastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      MidView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
