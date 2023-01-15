import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2ff);
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);

  //Cards Color

  static List<Color> cardsColor = [
    const Color.fromARGB(255, 94, 116, 244),
    const Color.fromARGB(255, 86, 198, 232),
    const Color.fromARGB(255, 86, 232, 171),
    const Color.fromARGB(255, 115, 232, 86),
    const Color.fromARGB(255, 225, 234, 98),
    const Color.fromARGB(255, 242, 166, 94),
    const Color.fromARGB(255, 246, 102, 119),
    const Color.fromARGB(255, 238, 95, 188),
    const Color.fromARGB(255, 172, 103, 246),

  ];

  //Text Style

  static TextStyle mainTitle = GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle mainContent = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.normal);

  static TextStyle dateTitle = GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}
