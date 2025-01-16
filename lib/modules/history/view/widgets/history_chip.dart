import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/history/view_model/history_vm.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';
import 'package:weather_app/shared/utils/moisac_decoration_image.dart';
import 'package:weather_app/shared/utils/string_extensions.dart';

class HistoryChip extends StatelessWidget {
  const HistoryChip({super.key, required this.city});
  final String city;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomepageVm>().fetchWeatherData(city);
      },
      child: Container(
        decoration: BoxDecoration(
          image: MoisacDecorationImage.moisac,
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10)
            .copyWith(left: 15, right: 5),
        margin: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              city.titleCase,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              radius: 30,
              onTap: () {
                context.read<HistoryVM>().removeHistory(city);
              },
              child: Container(
                constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.clear_rounded,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
