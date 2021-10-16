import "package:flutter/material.dart";
import 'package:weather_forecast/models/weather_forcast_model.dart';
import 'package:weather_forecast/network/network.dart';
import '../widgets/mid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<WeatherForcastModel>? forecastObj;
  String _cityName = "mumbai";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    forecastObj = getWeather(city: _cityName);

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
          TextFieldView(),
          Container(
            child: FutureBuilder<WeatherForcastModel>(
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
                  return Container(
                    margin: const EdgeInsets.all(30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextFieldView() {
    return TextField(
        decoration: const InputDecoration(
          hintText: "Entrez le nom d'une region",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            if (value != "") {
              _cityName = value;
            } else {
              _cityName = "dakar";
            }
            forecastObj = getWeather(city: _cityName);
          });
        });
  }

  Future<WeatherForcastModel> getWeather({String? city}) =>
      Network().getWeatherforcast(cityName: _cityName);
}
