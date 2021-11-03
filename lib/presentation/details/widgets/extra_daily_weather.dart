import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/data/models/daily_weather.dart';

class ExtraTomorrowWeather extends StatelessWidget {
  final DailyWeather weather;
  const ExtraTomorrowWeather({Key? key,required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              weather.daily![0].windSpeed!.round().toString() + " Km/h",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Wind",
              style: TextStyle( color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300, fontSize: 16),
            )
          ],
        ),
        const SizedBox(width: 5,),
        Column(
          children: [
            const Icon(
              CupertinoIcons.drop,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              weather.daily![0].humidity!.round().toString() + " %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Humidity",
              style: TextStyle( color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300, fontSize: 16),
            )
          ],
        ),
        const SizedBox(width: 5,),

        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_rain,
              color:AppColors.whiteColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              weather.daily![0].uvi.toString() + " %",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Chance Of Rain",
              style: TextStyle( color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
