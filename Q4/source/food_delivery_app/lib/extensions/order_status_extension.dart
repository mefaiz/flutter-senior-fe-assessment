import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/order.dart';

// Presentation mapping for [OrderStatus]: color, icon, and user-facing message.
extension OrderStatusExtension on OrderStatus {
  Color get color {
    switch (this) {
      case OrderStatus.preparing:
        return AppColors.statusPreparing;
      case OrderStatus.onTheWay:
        return AppColors.statusOnTheWay;
      case OrderStatus.delivered:
        return AppColors.statusDelivered;
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStatus.preparing:
        return Icons.restaurant;
      case OrderStatus.onTheWay:
        return Icons.delivery_dining;
      case OrderStatus.delivered:
        return Icons.check_circle;
    }
  }

  String get message {
    switch (this) {
      case OrderStatus.preparing:
        return AppStrings.statusPreparing;
      case OrderStatus.onTheWay:
        return AppStrings.statusOnTheWay;
      case OrderStatus.delivered:
        return AppStrings.statusDelivered;
    }
  }
}
