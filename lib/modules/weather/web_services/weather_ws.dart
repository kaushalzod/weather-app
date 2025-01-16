import 'package:dartz/dartz.dart';
import 'package:weather_app/core/dio/dio_client.dart';
import 'package:weather_app/modules/weather/model/weather_data_model.dart';

class WeatherWS {
  final DioClient _dio = DioClient.instance;
  final String apiKey = const String.fromEnvironment("API_KEY");

  Future<Either<String, WeatherData>> fetchCurrentWeather(
      String city, String unit) async {
    const url = 'weather';
    try {
      final response = await _dio.get(url,
          queryParameters: {'q': city, 'units': unit, 'appid': apiKey});
      if (response.statusCode == 200) {
        return Right(WeatherData.fromJson(response.data));
      }
      return const Left("City not found");
    } catch (e) {
      return const Left("City not found");
    }
  }
}
