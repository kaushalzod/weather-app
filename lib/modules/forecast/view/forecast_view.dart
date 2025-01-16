import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/forecast/model/sorted_forecast_model.dart';
import 'package:weather_app/modules/forecast/view/widget/forecast_card.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<HomepageVm, Tuple2<List<SortedForecast>?, bool>>(
      selector: (p0, p1) => Tuple2(p1.forecastData, p1.isLoading),
      builder: (context, value, child) {
        final forecast = value.value1;
        return SizedBox(
          height: 200,
          child: ListView.separated(
            itemCount: (forecast?.length ?? 0) < 4 ? forecast?.length ?? 0 : 4,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final date = forecast?[index].date;
              final forecastData = forecast?[index].forecast;
              return ForecastCard(date: date, forecastData: forecastData);
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: true,
          ),
        );
      },
    );
  }
}
