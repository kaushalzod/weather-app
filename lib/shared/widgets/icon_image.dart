import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, this.icon, this.dimension});
  final String? icon;
  final double? dimension;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 150,
      child: CachedNetworkImage(
        imageUrl: "https://openweathermap.org/img/wn/${icon ?? ""}@4x.png",
      ),
    );
  }
}
