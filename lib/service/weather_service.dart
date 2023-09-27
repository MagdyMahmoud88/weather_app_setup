import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    const String baseUrl = 'https://api.weatherapi.com/v1';
    const String apiKey = '64ac964a79684c8692d104516232702';
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]['message'] ??
          'oops , the is was an error tray later';
      log(e.toString());
      throw Exception(errMessage);
    } catch (e) {
      print(e.toString());
      throw Exception('ERROR');
    }
  }
}
