part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherError extends WeatherState {
 final String message;
  WeatherError({required this.message});
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  WeatherLoaded({required this.weather});
}


class DailyWeatherLoaded extends WeatherState {
  final DailyWeather weather;
  DailyWeatherLoaded({required this.weather});
}
