import 'package:weather_app/data/models/daily_weather.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherRepository{

  WeatherService weatherService;
  WeatherRepository({required this.weatherService});


  Future<WeatherModel> getWeather({required String city}) async {
    final weather=await weatherService.getWeather(city);
    return  WeatherModel.fromJson(weather);
  }

  Future<DailyWeather> getDailyWeather(double lat,double lon) async{
    final dailyWeather=await weatherService.getDailyWeather(lat, lon);
    return DailyWeather.fromJson(dailyWeather);
  }

}