import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

/// Primary action button (main color). Use [appearsDisabled] to show grey style
/// while still allowing tap (e.g. to show SnackBar).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.appearsDisabled = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  /// When true, button looks grey but remains tappable (onPressed still fires).
  final bool appearsDisabled;

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onPressed != null;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isInteractive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.buttonPaddingVertical),
          backgroundColor: appearsDisabled ? AppColors.textMuted : AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.textMuted,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: AppDimens.fontSizeXl,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
