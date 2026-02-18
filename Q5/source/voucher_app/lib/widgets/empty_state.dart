import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';

/// Centered empty state: icon + message.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.iconSize = 80,
    this.fontSize = AppDimens.fontSizeXl,
  });

  final IconData icon;
  final String message;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: AppColors.textMuted),
          const SizedBox(height: AppDimens.spaceLg),
          Text(
            message,
            style: TextStyle(fontSize: fontSize, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
