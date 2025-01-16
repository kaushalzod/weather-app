import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ForecastTemp extends StatelessWidget {
  final bool isDegree;
  final String? temp;
  final String? icon;

  const ForecastTemp({super.key, required this.isDegree, this.temp, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$temp${isDegree ? '°C' : '°F'}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox.square(
          dimension: 60,
          child: CachedNetworkImage(
            imageUrl: "https://openweathermap.org/img/wn/${icon ?? ""}@2x.png",
          ),
        ),
      ],
    );
  }
}
