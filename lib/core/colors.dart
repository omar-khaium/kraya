import 'package:flutter/material.dart';

class ColorSystem {
  static ColorSystem get instance => _instance;

  static final ColorSystem _instance = ColorSystem._();

  ColorSystem._();

  Color get background => Colors.white;
  Color get card => Colors.grey.shade100;
  Color get cardDeep => Colors.grey.shade200;
  Color get primary => const Color.fromARGB(255, 85, 148, 241);
  Color get gradientStart => const Color.fromARGB(255, 65, 114, 227);
  Color get gradientEnd => const Color.fromARGB(255, 96, 166, 250);
  Color get text => Colors.grey.shade900;
  Color get error => Colors.red;
  Color get secondaryText => Colors.grey;
  Color get alternateText => Colors.grey.shade50;
  Color get hint => Colors.grey.shade400;
}
