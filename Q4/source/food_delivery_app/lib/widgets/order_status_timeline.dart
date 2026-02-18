import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../models/order.dart';

// Horizontal timeline: Order Placed → Preparing → Delivered.
class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TimelineStep(
          label: AppStrings.orderPlaced,
          icon: Icons.receipt,
          isActive: true,
        ),
        TimelineLine(isActive: order.status.index >= OrderStatus.onTheWay.index),
        TimelineStep(
          label: AppStrings.preparing,
          icon: Icons.restaurant,
          isActive: order.status.index >= OrderStatus.preparing.index,
        ),
        TimelineLine(isActive: order.status.index >= OrderStatus.delivered.index),
        TimelineStep(
          label: AppStrings.delivered,
          icon: Icons.check_circle,
          isActive: order.status.index >= OrderStatus.delivered.index,
        ),
      ],
    );
  }
}

// A step in the timeline.
class TimelineStep extends StatelessWidget {
  const TimelineStep({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
  });

  final String label;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isActive ? AppColors.success : AppColors.timelineInactive,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: AppDimens.iconSizeLg,
            ),
          ),
          const SizedBox(height: AppDimens.spaceSm),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimens.fontSizeSm,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// A line connecting the timeline steps.
class TimelineLine extends StatelessWidget {
  const TimelineLine({required this.isActive, super.key});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 40),
        color: isActive ? AppColors.success : AppColors.timelineInactive,
      ),
    );
  }
}
