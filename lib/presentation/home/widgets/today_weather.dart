import 'package:flutter/material.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/models/daily_weather.dart';
import 'hourly_weather.dart';

class TodayWeather extends StatelessWidget {
  final DailyWeather weather;
  const TodayWeather({Key? key,required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, detailsScreen,arguments: weather);
                },
                child: Row(
                  children: const [
                    Text(
                      "8 days ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          HourlyWeather(weather: weather),
        ],
      ),
    );
  }
}
