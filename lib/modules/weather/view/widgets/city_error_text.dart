import 'package:flutter/material.dart';

class CityErrorText extends StatelessWidget {
  const CityErrorText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      "City Not Found\n Check for spelling mistakes",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
