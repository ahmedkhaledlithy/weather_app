import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/secret.dart';

class WeatherService {

  Future<Secret> secret = SecretLoader(secretPath: "assets/secret.json").load();

  late Dio dio;

  WeatherService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000, //5s
      receiveTimeout: 3000,
    );
    dio = Dio(options);
  }

  Future<dynamic> getWeather(String city) async {
    String apiKey="";
    secret.then((value) {
      apiKey= value.apikey;
    });
    final queryParameters = {
      'q': city,
      'appid': apiKey,
      'units': 'metric'
    };

    try {
      Response response = await dio.get("weather", queryParameters: queryParameters);
      if (response.statusCode == 200) {
       // return WeatherModel.fromJson(response.data);
        return response.data;
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode!;
      }

    } catch (e) {
      throw("some arbitrary error: ${e.toString()}");
    //  rethrow;
    }
  }

  Future<dynamic> getDailyWeather(double lat,double lon) async {

    String apiKey="";
    secret.then((value) {
      apiKey= value.apikey;
    });
    final queryParameters = {
      'appid': apiKey,
      'lat': lat,
      'lon': lon,
      'units': 'metric'
    };
    try {
      Response response = await dio.get("onecall", queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode!;
      }

    } catch (e) {
      throw("some arbitrary error: ${e.toString()}");
    }
  }
}
