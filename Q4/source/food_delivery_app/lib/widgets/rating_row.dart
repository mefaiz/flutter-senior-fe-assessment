import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';

/// Star icon + rating value row.
class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rating,
    this.iconSize = AppDimens.iconSizeSm,
    this.fontSize = AppDimens.fontSizeMd,
  });

  final double rating;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: AppColors.star, size: iconSize),
        const SizedBox(width: AppDimens.spaceXs),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
