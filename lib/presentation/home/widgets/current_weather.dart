import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/models/daily_weather.dart';

import 'extra_weather.dart';

class CurrentWeather extends StatelessWidget {
  final DailyWeather weather;

  const CurrentWeather({Key? key, required this.weather}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();

    return Container(
      height: MediaQuery.of(context).size.height - 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 30, right: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff00A1FF),
      ),
      child: Column(
        children: [
          Image(
            width: 220,
            height: 220,
            image: AssetImage(
                findIcon(weather.current!.weather![0].main.toString(), true)),
            fit: BoxFit.fill,
          ),

          Text(
            weather.current!.temp!.round().toString() + "\u00B0",
            style: const TextStyle(
                height: 0.1,
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(weather.current!.weather![0].main.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(DateFormat("EEEE, dd MMMM").format(date),
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w300
              )),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: AppColors.whiteColor,
          ),
          const SizedBox(
            height: 10,
          ),
          ExtraWeather(
            weather: weather,
          ),
        ],
      ),
    );
  }
}
