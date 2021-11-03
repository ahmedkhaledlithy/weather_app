import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/data/models/daily_weather.dart';

import '../widgets/daily_weather.dart';
import '../widgets/tomorrow_weather.dart';

class DetailsScreen extends StatelessWidget {
  final DailyWeather weather;

  const DetailsScreen({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.calendar_today,
              color: AppColors.whiteColor,
              size: 20,
            ),
            Text(
              " 8 days",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          TomorrowWeatherWidget(weather: weather),
          const SizedBox(height: 25,),
          DailyWeatherWidget(weather: weather),
        ],
      ),
    );
  }
}
