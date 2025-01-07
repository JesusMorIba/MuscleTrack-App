import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Heading Styles with color parameter
  static TextStyle heading1({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 48, fontWeight: FontWeight.bold, color: color);
  static TextStyle heading2({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 40, fontWeight: FontWeight.bold, color: color);
  static TextStyle heading3({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 32, fontWeight: FontWeight.bold, color: color);
  static TextStyle heading4({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 24, fontWeight: FontWeight.bold, color: color);
  static TextStyle heading5({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 20, fontWeight: FontWeight.bold, color: color);
  static TextStyle heading6({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.bold, color: color);

  static TextStyle heading1SemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 48, fontWeight: FontWeight.w600, color: color);
  static TextStyle heading2SemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 40, fontWeight: FontWeight.w600, color: color);
  static TextStyle heading3SemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 32, fontWeight: FontWeight.w600, color: color);
  static TextStyle heading4SemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 24, fontWeight: FontWeight.w600, color: color);
  static TextStyle heading5SemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 20, fontWeight: FontWeight.w600, color: color);
  static TextStyle headingSemiBold6({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.w600, color: color);

  // Body Text Styles with color parameter
  static TextStyle bodyXLargeBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.bold, color: color);
  static TextStyle bodyXLargeSemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.w600, color: color);
  static TextStyle bodyXLargeMedium({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.w500, color: color);
  static TextStyle bodyXLargeRegular({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 18, fontWeight: FontWeight.w400, color: color);

  static TextStyle bodyLargeBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 16, fontWeight: FontWeight.bold, color: color);
  static TextStyle bodyLargeSemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 16, fontWeight: FontWeight.w600, color: color);
  static TextStyle bodyLargeMedium({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 16, fontWeight: FontWeight.w500, color: color);
  static TextStyle bodyLargeRegular({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 16, fontWeight: FontWeight.w400, color: color);

  static TextStyle bodyMediumBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 14, fontWeight: FontWeight.bold, color: color);
  static TextStyle bodyMediumSemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 14, fontWeight: FontWeight.w600, color: color);
  static TextStyle bodyMediumMedium({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 14, fontWeight: FontWeight.w500, color: color);
  static TextStyle bodyMediumRegular({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 14, fontWeight: FontWeight.w400, color: color);

  static TextStyle bodySmallBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 12, fontWeight: FontWeight.bold, color: color);
  static TextStyle bodySmallSemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 12, fontWeight: FontWeight.w600, color: color);
  static TextStyle bodySmallMedium({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 12, fontWeight: FontWeight.w500, color: color);
  static TextStyle bodySmallRegular({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 12, fontWeight: FontWeight.w400, color: color);

  static TextStyle bodyXSmallBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 10, fontWeight: FontWeight.bold, color: color);
  static TextStyle bodyXSmallSemiBold({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 10, fontWeight: FontWeight.w600, color: color);
  static TextStyle bodyXSmallMedium({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 10, fontWeight: FontWeight.w500, color: color);
  static TextStyle bodyXSmallRegular({Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          fontSize: 10, fontWeight: FontWeight.w400, color: color);
}
