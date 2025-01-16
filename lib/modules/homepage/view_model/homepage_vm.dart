import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/modules/forecast/model/forecast_model.dart';
import 'package:weather_app/modules/forecast/model/sorted_forecast_model.dart';
import 'package:weather_app/modules/forecast/web_services/forecast_ws.dart';
import 'package:weather_app/modules/history/view_model/history_vm.dart';
import 'package:weather_app/modules/weather/model/weather_data_model.dart';
import 'package:weather_app/modules/weather/web_services/weather_ws.dart';

class HomepageVm extends ChangeNotifier {
  HomepageVm({required this.historyvm});

  final weatherService = WeatherWS();
  final forecastService = ForecastWS();

  final HistoryVM historyvm;
  WeatherData? weatherData;
  List<SortedForecast>? forecastData;
  TextEditingController controller = TextEditingController();

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isDegree = true;
  bool get isDegree => _isDegree;
  set isDegree(bool val) {
    _isDegree = val;
    notifyListeners();
  }

  void searchCity() {
    if (isLoading) return;
    if (controller.text.trim().isNotEmpty) {
      fetchWeatherData(controller.text);
    }
  }

  void fetchWeatherData(String city, {bool historyUpdate = true}) async {
    try {
      if (!isLoading) {
        isLoading = true;
        notifyListeners();
      }
      historyvm.addHistory(city.trim().toLowerCase(), update: historyUpdate);
      final currentWeather = await weatherService.fetchCurrentWeather(
          city, isDegree ? "metric" : "imperial");
      final forecast = await forecastService.fetch3DayForecast(
          city, isDegree ? "metric" : "imperial");
      currentWeather.fold((l) {
        Fluttertoast.showToast(msg: l);
        weatherData = null;
      }, (r) => weatherData = r);
      forecast.fold((l) {
        forecastData = null;
      }, (r) => forecastData = [...categorizeAndSortForecasts(r.forecast)]);
      isLoading = false;
      controller.clear();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  List<SortedForecast> categorizeAndSortForecasts(List<Forecast>? forecasts) {
    DateTime now = DateTime.now();
    String todayDate =
        DateTime(now.year, now.month, now.day).toIso8601String().split('T')[0];
    Map<String, List<Forecast>> categorizedForecasts = {};

    for (var forecast in forecasts ?? []) {
      if (forecast.dt != null) {
        DateTime forecastDate =
            DateTime.fromMillisecondsSinceEpoch(forecast.dt! * 1000);
        String date =
            DateTime(forecastDate.year, forecastDate.month, forecastDate.day)
                .toIso8601String()
                .split('T')[0];

        if (date != todayDate) {
          categorizedForecasts.putIfAbsent(date, () => []).add(forecast);
        }
      }
    }

    for (var date in categorizedForecasts.keys) {
      categorizedForecasts[date]?.sort(
        (a, b) {
          double tempA = a.main?.temp ?? double.maxFinite;
          double tempB = b.main?.temp ?? double.maxFinite;
          return tempA.compareTo(tempB);
        },
      );
    }

    Map<String, List<Forecast>> sortedForecasts = Map.fromEntries(
      categorizedForecasts.entries.toList()
        ..sort((a, b) => a.key.compareTo(b.key)),
    );

    return sortedForecasts.keys
        .map((e) => SortedForecast(date: e, forecast: sortedForecasts[e] ?? []))
        .toList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
