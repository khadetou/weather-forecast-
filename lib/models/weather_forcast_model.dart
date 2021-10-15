import 'city.dart';
import 'lista.dart';

class WeatherForcastModel {
  String? cod;
  int? message;
  int? cnt;
  List<Lista>? lista;
  City? city;

  WeatherForcastModel({
    this.cod,
    this.message,
    this.cnt,
    this.lista,
    this.city,
  });

  factory WeatherForcastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForcastModel(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      lista: (json['list'] as List<dynamic>?)
          ?.map((e) => Lista.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': lista?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
      };
}
