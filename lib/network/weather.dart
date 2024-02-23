import 'dart:convert';

import 'package:http/http.dart' as http;

import '../secrets/secrets.dart';

class Weather {
  final String name;
  final int temp;
  final int windSpeed;
  final int windDirection;

  const Weather({
    required this.name,
    required this.temp,
    required this.windSpeed,
    required this.windDirection,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    double temp = json['main']['temp'];
    double windSpeed = json['wind']['speed'];
    int windDirection = json['wind']['deg'];

    return Weather(
      name: name,
      temp: temp.floor(),
      windSpeed: windSpeed.floor(),
      windDirection: windDirection,
    );
  }
}

Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&lat=59.303&lon=18.0273&units=metric&lang=sv'));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to fetch weather');
  }
}
