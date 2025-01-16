import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/history/view/widgets/history_chip.dart';
import 'package:weather_app/modules/history/view_model/history_vm.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryVM>(
      builder: (context, vm, child) {
        if (vm.history.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                for (String item in vm.history) HistoryChip(city: item)
              ],
            ),
          ),
        );
      },
    );
  }
}
