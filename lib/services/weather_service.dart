import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

// http://api.weatherapi.com/v1/forecast.json?key=fce309462f6d4197b70123542241801&q=cairo&days=10
class WeatherService {
  final Dio dio;
  final String baseUel = 'https://api.weatherapi.com/v1';
  final String apiKey = 'fce309462f6d4197b70123542241801';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUel/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error, try later');
    }
  }
}
