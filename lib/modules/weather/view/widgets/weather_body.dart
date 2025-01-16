import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/model/weather_data_model.dart';
import 'package:weather_app/modules/weather/view/widgets/conversion_button.dart';
import 'package:weather_app/modules/weather/view/widgets/temp_text.dart';
import 'package:weather_app/shared/widgets/icon_image.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, this.weather});
  final WeatherData? weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          weather?.name ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          weather?.weather?.firstOrNull?.main ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          weather?.getVisibilityType ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40),
        TempratureText(temp: weather?.main?.temp.toString()),
        const SizedBox(height: 20),
        WeatherIcon(icon: weather?.weather?.firstOrNull?.icon),
        ConversionButton(cityName: weather?.name)
      ],
    );
  }
}
