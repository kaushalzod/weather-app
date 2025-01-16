import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';

class ConversionButton extends StatelessWidget {
  const ConversionButton({super.key, this.cityName});
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomepageVm>();
    return GestureDetector(
      onTap: () {
        vm.isDegree = !vm.isDegree;
        vm.fetchWeatherData(cityName ?? "Indore");
      },
      child: Container(
        height: 48,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "Switch to ${!vm.isDegree ? 'Celcius' : 'Fahrenheit'}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
