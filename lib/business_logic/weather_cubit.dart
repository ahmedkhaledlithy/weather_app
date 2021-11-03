import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/daily_weather.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherModel current=WeatherModel();
  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  WeatherModel fetchWeather({required String city})  {
    try {
      weatherRepository.getWeather(city: city).then((current){
        this.current=current;
        emit(WeatherLoaded(weather: current));
      });

    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
    return current;
  }

  void fetchDailyWeather({required lat,lon}) async {
    emit(WeatherLoading());
    try {
      DailyWeather daily = await weatherRepository.getDailyWeather(lat,lon);
      emit(DailyWeatherLoaded(weather: daily));
    } catch (e,trace) {
      emit(WeatherError(message: e.toString()+trace.toString(),));
    }
  }
}
