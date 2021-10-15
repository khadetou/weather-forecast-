import 'clouds.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class Lista {
	int? dt;
	Main? main;
	List<Weather>? weather;
	Clouds? clouds;
	Wind? wind;
	int? visibility;
	int? pop;
	Sys? sys;
	String? dtTxt;

	Lista({
		this.dt, 
		this.main, 
		this.weather, 
		this.clouds, 
		this.wind, 
		this.visibility, 
		this.pop, 
		this.sys, 
		this.dtTxt, 
	});

	factory Lista.fromJson(Map<String, dynamic> json) => Lista(
				dt: json['dt'] as int?,
				main: json['main'] == null
						? null
						: Main.fromJson(json['main'] as Map<String, dynamic>),
				weather: (json['weather'] as List<dynamic>?)
						?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
						.toList(),
				clouds: json['clouds'] == null
						? null
						: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
				wind: json['wind'] == null
						? null
						: Wind.fromJson(json['wind'] as Map<String, dynamic>),
				visibility: json['visibility'] as int?,
				pop: json['pop'] as int?,
				sys: json['sys'] == null
						? null
						: Sys.fromJson(json['sys'] as Map<String, dynamic>),
				dtTxt: json['dt_txt'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'dt': dt,
				'main': main?.toJson(),
				'weather': weather?.map((e) => e.toJson()).toList(),
				'clouds': clouds?.toJson(),
				'wind': wind?.toJson(),
				'visibility': visibility,
				'pop': pop,
				'sys': sys?.toJson(),
				'dt_txt': dtTxt,
			};
}
