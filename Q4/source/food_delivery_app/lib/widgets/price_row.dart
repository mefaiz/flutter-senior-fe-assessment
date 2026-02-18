import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';
import '../utils/format.dart';

// A row showing a label and a formatted price.
class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.label, required this.amount});

  final String label;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.spaceSm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(Format.price(amount)),
        ],
      ),
    );
  }
}
