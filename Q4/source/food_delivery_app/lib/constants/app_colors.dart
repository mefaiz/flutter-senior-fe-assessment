import 'package:flutter/material.dart';

/// App-wide color constants (for consistency; theme still drives most colors).
class AppColors {
  AppColors._();

  static const Color primary = Colors.green;
  static const Color primaryText = Colors.green;
  /// Light green for SnackBar / soft success backgrounds (bolder than green[50]).
  static const Color primaryLight = Color(0xFFC8E6C9); // green[100]

  static const Color star = Colors.amber;
  static const Color badge = Colors.red;

  static const Color success = Colors.green;
  static const Color statusPreparing = Colors.orange;
  static const Color statusOnTheWay = Colors.blue;
  static const Color statusDelivered = Colors.green;

  static const Color timelineInactive = Color(0xFFE0E0E0); // grey[300]
  static const Color textMuted = Color(0xFF757575); // grey[600]
  static const Color textMutedDark = Color(0xFF616161); // grey[700]
  static const Color surfaceLight = Color(0xFFF5F5F5); // grey[100]
}
