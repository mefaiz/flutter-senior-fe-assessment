import 'package:flutter/material.dart';

/// App-wide color constants.
class AppColors {
  AppColors._();

  static const Color primary = Colors.indigo;
  static const Color primaryText = Colors.indigo;

  /// Light background for SnackBar / success feedback.
  static const Color primaryLight = Color(0xFFC5CAE9); // indigo[100]

  static const Color textMuted = Color(0xFF757575);
  static const Color surfaceLight = Color(0xFFF5F5F5);

  /// Secondary action (Back, Cancel): grey bg, white text when needed.
  static const Color secondaryButtonBg = Color(0xFF757575);
}
