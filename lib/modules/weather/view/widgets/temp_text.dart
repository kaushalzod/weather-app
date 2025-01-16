import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';

class TempratureText extends StatelessWidget {
  const TempratureText({super.key, this.temp});
  final String? temp;
  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomepageVm>();
    return Text(
      "$temp${vm.isDegree ? '°C' : '°F'}",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 80,
        height: 0.7,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
