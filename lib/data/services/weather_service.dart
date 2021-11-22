import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/strings.dart';
import 'package:weather_app/secret.dart';

class WeatherService {

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


    Secret secret = await SecretLoader(secretPath: "assets/secret.json").load();

    final queryParameters = {
      'q': city,
      'appid': secret.apikey,
      'units': 'metric'
    };

    try {
      Response response = await dio.get("weather", queryParameters: queryParameters);
      if (response.statusCode == 200) {

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

  //  String myAppId = await secureKeys.getKeys();
    Secret secret = await SecretLoader(secretPath: "assets/secret.json").load();

    final queryParameters = {
      'appid': secret.apikey,
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
