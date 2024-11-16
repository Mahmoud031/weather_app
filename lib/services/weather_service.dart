import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'bd2382aa680e4e6d809183133241408';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMesaage = e.response?.data['error']['message'] ??
          'oops there was an error ,please try Later'; //اللي عاليمين هيتعرض لو الشمال Null
      throw Exception(errorMesaage);
    } catch (e){
      log(e.toString());
      throw Exception('oops there was an error ,please try Later');
    }
  }
}
