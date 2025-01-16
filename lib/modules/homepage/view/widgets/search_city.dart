import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modules/homepage/view_model/homepage_vm.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({super.key});
  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomepageVm>();
    return TextField(
      controller: vm.controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        isDense: false,
        contentPadding: const EdgeInsets.all(20),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 80,
          minHeight: 80,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Selector<HomepageVm, bool>(
            selector: (p0, p1) => p1.isLoading,
            builder: (context, isLoading, child) => IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => vm.searchCity(),
              icon: isLoading
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(FeatherIcons.search),
            ),
          ),
        ),
        hintText: 'Search places',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
