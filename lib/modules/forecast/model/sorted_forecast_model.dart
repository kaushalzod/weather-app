import 'package:weather_app/modules/forecast/model/forecast_model.dart';

class SortedForecast {
  final String date;
  final List<Forecast> forecast;

  SortedForecast({
    required this.date,
    required this.forecast,
  });
}
