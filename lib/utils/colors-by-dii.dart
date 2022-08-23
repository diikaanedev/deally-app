import 'package:flutter/material.dart';

// ignore: use_full_hex_values_for_flutter_colors
Color rouge = const Color(0xffff00000);
// ignore: use_full_hex_values_for_flutter_colors
Color blanc = const Color(0xffffffff);
// ignore: use_full_hex_values_for_flutter_colors
Color meuveFonce = const Color(0xFFC22AF4);

// ignore: use_full_hex_values_for_flutter_colors
Color meuveClair = const Color(0xFFFBF4FE);

// ignore: use_full_hex_values_for_flutter_colors
Color gris = const Color(0xFFE7E7E7);
// ignore: use_full_hex_values_for_flutter_colors
Color noir = const Color(0xFF000000);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
