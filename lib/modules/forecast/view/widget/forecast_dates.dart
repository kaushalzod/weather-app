import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastDates extends StatelessWidget {
  const ForecastDates({super.key, this.date});
  final String? date;
  @override
  Widget build(BuildContext context) {
    final dateData = DateTime.tryParse(date ?? "") ?? DateTime.now();
    final weekday = DateFormat('EEEE').format(dateData);
    return Column(
      children: [
        Text(
          weekday,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          date ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
