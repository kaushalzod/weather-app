import 'package:flutter/material.dart';
import 'package:weather_app/modules/forecast/model/forecast_model.dart';
import 'package:weather_app/modules/forecast/view/widget/forecast_dates.dart';
import 'package:weather_app/modules/forecast/view/widget/forecast_low_high.dart';
import 'package:weather_app/shared/utils/moisac_decoration_image.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key, this.date, this.forecastData});
  final String? date;
  final List<Forecast>? forecastData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
        image: MoisacDecorationImage.moisac,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ForecastDates(date: date),
            const SizedBox(height: 20),
            ForecastLowHigh(forecastData: forecastData)
          ],
        ),
      ),
    );
  }
}
