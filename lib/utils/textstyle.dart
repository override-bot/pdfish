import 'package:flutter/widgets.dart';

class ResponsiveTextStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  ResponsiveTextStyle({
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = const Color(0xFF000000),
  });

  TextStyle textStyle(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor =
        screenWidth / 375.0; // Adjust to your base design size (e.g., 375.0).

    final responsiveFontSize = fontSize * scaleFactor;

    return TextStyle(
      fontSize: responsiveFontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
