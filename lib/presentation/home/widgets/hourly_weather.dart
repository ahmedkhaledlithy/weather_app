import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/data/models/daily_weather.dart';

class HourlyWeather extends StatefulWidget {
  final DailyWeather weather;

  const HourlyWeather({Key? key, required this.weather}) : super(key: key);

  @override
  State<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  final DateTime date = DateTime.now();
  late final int hour;

  @override
  void initState() {
    hour = int.parse(DateFormat("h").format(date));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height:currentOrientation==Orientation.portrait?MediaQuery.of(context).size.height *0.2 :MediaQuery.of(context).size.height *0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.weather.hourly!.take(6).length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(35)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.weather.hourly![index].temp.round()}" "\u00B0",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Image(
                image: AssetImage(findIcon(
                    widget.weather.hourly![index].weather![0].main.toString(),
                    false)),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                Duration(hours: hour + index + 1)
                        .toString()
                        .split(":")[0]
                        .toString() +
                    ":00",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
