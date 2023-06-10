import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSystem {
  static TextSystem get instance => _instance;

  static final TextSystem _instance = TextSystem._();

  TextSystem._();

  TextStyle verySmall(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: color));
  TextStyle small(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, color: color));
  TextStyle normal(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: color));
  TextStyle button(Color color, [bool smallText = false]) =>
      GoogleFonts.montserrat(textStyle: TextStyle(fontSize: smallText ? 18 : 20, color: color, fontWeight: FontWeight.bold));
  TextStyle large(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold));
  TextStyle veryLarge(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 18, color: color));
  TextStyle tooLarge(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w600));
  TextStyle extraLarge(Color color) => GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 28, color: color, fontWeight: FontWeight.w600));
}
