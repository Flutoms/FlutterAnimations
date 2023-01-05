import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle globalTextStyle(
    {Color color = Colors.white70, FontWeight? fontWeight, double? fontSize}) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
  );
}
