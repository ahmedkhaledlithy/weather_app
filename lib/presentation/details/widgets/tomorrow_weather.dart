import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/models/daily_weather.dart';

import 'extra_daily_weather.dart';

class TomorrowWeatherWidget extends StatelessWidget {
  final DailyWeather weather;

  const TomorrowWeatherWidget({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Container(
      height:currentOrientation==Orientation.portrait ? MediaQuery.of(context).size.height * 0.45 : MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff00A1FF),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          findIcon(weather.daily![0].weather![0].main!, true),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Tomorrow",
                        style: TextStyle(fontSize: 26),
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              weather.daily![0].temp!.max!.round().toString(),
                              style: const TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "/" +
                                  weather.daily![0].temp!.min!
                                      .round()
                                      .toString() +
                                  "\u00B0",
                              style: const TextStyle(
                                  color: AppColors.whiteColor54,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        " " + weather.daily![0].weather![0].main!,
                        style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.whiteColor54,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 30,
                left: 30,
              ),
              child: Column(
                children: [
                  const Divider(color: AppColors.whiteColor),
                  const SizedBox(height: 10),
                  ExtraTomorrowWeather(
                    weather: weather,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
