import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';
import 'package:weather_app/modules/weather/model/weather_data_model.dart';
import 'package:weather_app/modules/weather/view/widgets/city_error_text.dart';
import 'package:weather_app/modules/weather/view/widgets/weather_body.dart';
import 'package:weather_app/shared/utils/moisac_decoration_image.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<HomepageVm, Tuple2<WeatherData?, bool>>(
      selector: (p0, p1) => Tuple2(p1.weatherData, p1.isLoading),
      builder: (context, value, child) {
        final weather = value.value1;
        final loading = value.value2;
        return Container(
          height: 500,
          decoration: BoxDecoration(
            image: MoisacDecorationImage.moisac,
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xfffad345),
          ),
          alignment: loading || weather == null
              ? Alignment.center
              : Alignment.topCenter,
          child: loading
              ? const CircularProgressIndicator(color: Colors.black)
              : weather == null
                  ? const CityErrorText()
                  : WeatherBody(weather: weather),
        );
      },
    );
  }
}
