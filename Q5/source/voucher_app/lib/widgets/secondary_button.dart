import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

/// Secondary action (e.g. Back, Cancel): grey style.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.buttonPaddingVertical),
        foregroundColor: AppColors.secondaryButtonBg,
        side: const BorderSide(color: AppColors.secondaryButtonBg),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: AppDimens.fontSizeLg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
