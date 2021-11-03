import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/models/daily_weather.dart';

class DailyWeatherWidget extends StatelessWidget {
  final DailyWeather weather;

  const DailyWeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Expanded(
      child: ListView.builder(
        itemCount: weather.daily!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    DateFormat("EEEE")
                        .format(DateTime(
                            date.year, date.month, date.day + index + 1))
                        .substring(0, 3),
                    style: const TextStyle(fontSize: 20)),
                SizedBox(
                  width: 135,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(findIcon(
                            weather.daily![index].weather![0].main!, false)),
                        width: 40,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        weather.daily![index].weather![0].main!,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "+" + weather.daily![index].temp!.max!.round().toString() + "\u00B0",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "+" + weather.daily![index].temp!.min!.round().toString().toString() + "\u00B0",
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
