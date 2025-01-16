import 'package:flutter/material.dart';

class MoisacDecorationImage {
  static DecorationImage get moisac => DecorationImage(
        fit: BoxFit.cover,
        image: Image.asset('assets/moisac.png').image,
        opacity: 0.20,
        scale: 1,
      );
}
