import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/forecast/model/forecast_model.dart';
import 'package:weather_app/modules/forecast/view/widget/forecast_temp.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';

class ForecastLowHigh extends StatelessWidget {
  const ForecastLowHigh({super.key, this.forecastData});
  final List<Forecast>? forecastData;
  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomepageVm>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ForecastTemp(
          temp: forecastData?.firstOrNull?.main?.temp.toString(),
          isDegree: vm.isDegree,
          icon: forecastData?.firstOrNull?.weather?.firstOrNull?.icon,
        ),
        const SizedBox(height: 10),
        ForecastTemp(
          temp: forecastData?.lastOrNull?.main?.temp.toString(),
          isDegree: vm.isDegree,
          icon: forecastData?.lastOrNull?.weather?.lastOrNull?.icon,
        )
      ],
    );
  }
}
