import 'package:dartz/dartz.dart';
import 'package:weather_app/core/dio/dio_client.dart';
import 'package:weather_app/modules/forecast/model/forecast_response_model.dart';

class ForecastWS {
  final DioClient _dio = DioClient.instance;
  final String apiKey = const String.fromEnvironment("API_KEY");

  Future<Either<String, ForecastData>> fetch3DayForecast(
      String city, String unit) async {
    const url = 'forecast';
    try {
      final response = await _dio.get(
        url,
        queryParameters: {'q': city, 'units': unit, 'appid': apiKey},
      );
      if (response.statusCode == 200) {
        return Right(ForecastData.fromJson(response.data));
      }
      return const Left("City not found");
    } catch (e) {
      return const Left("City not found");
    }
  }
}
