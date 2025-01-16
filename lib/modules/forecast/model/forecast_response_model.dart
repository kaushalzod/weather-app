import 'package:weather_app/modules/forecast/model/city_model.dart';
import 'package:weather_app/modules/forecast/model/forecast_model.dart';

class ForecastData {
  String? cod;
  int? message;
  int? cnt;
  List<Forecast>? forecast;
  City? city;

  ForecastData({this.cod, this.message, this.cnt, this.forecast, this.city});

  ForecastData.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      forecast = <Forecast>[];
      json['list'].forEach((v) {
        forecast!.add(Forecast.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (forecast != null) {
      data['list'] = forecast!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}
