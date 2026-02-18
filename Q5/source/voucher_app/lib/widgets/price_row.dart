import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';

/// Label + formatted price row.
class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.label,
    required this.priceText,
    this.bold = false,
  });

  final String label;
  final String priceText;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? AppDimens.fontSizeXxl : AppDimens.fontSizeLg,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(priceText, style: style),
      ],
    );
  }
}
