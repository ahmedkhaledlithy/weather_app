import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/weather_cubit.dart';
import 'package:weather_app/data/models/daily_weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'constants/strings.dart';
import 'presentation/details/pages/details_screen.dart';
import 'presentation/home/pages/home_screen.dart';


class AppRouting {
  late WeatherRepository weatherRepository;
  late WeatherCubit weatherCubit;


  AppRouting() {
    weatherRepository = WeatherRepository(weatherService: WeatherService());
    weatherCubit = WeatherCubit(weatherRepository: weatherRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => weatherCubit,
                child: const HomeScreen(),
              ),
        );
      case detailsScreen:
      final selectedWeather = settings.arguments as DailyWeather;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => WeatherCubit(weatherRepository: weatherRepository),
              child: DetailsScreen(weather: selectedWeather),
            ));
    }
  }
}