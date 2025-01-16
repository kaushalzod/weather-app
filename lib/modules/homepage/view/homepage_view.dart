import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/forecast/view/forecast_view.dart';
import 'package:weather_app/modules/history/view/history_view.dart';
import 'package:weather_app/modules/history/view_model/history_vm.dart';
import 'package:weather_app/modules/homepage/view/widgets/search_city.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';
import 'package:weather_app/modules/weather/view/weather_view.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HistoryVM()),
        ChangeNotifierProvider<HomepageVm>(
          create: (context) => HomepageVm(
            historyvm: context.read<HistoryVM>(),
          )..fetchWeatherData("Indore", historyUpdate: false),
        ),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: const [
                SearchCity(),
                HistoryView(),
                SizedBox(height: 12),
                WeatherView(),
                SizedBox(height: 12),
                ForecastView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
