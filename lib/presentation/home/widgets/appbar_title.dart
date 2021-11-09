import 'package:flutter/material.dart';
import 'package:weather_app/data/models/daily_weather.dart';

class AppBarTitle extends StatelessWidget {
  final DailyWeather weather;
  const AppBarTitle({Key? key,required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      " " + weather.timezone!,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
