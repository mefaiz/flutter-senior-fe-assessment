import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../extensions/order_status_extension.dart';
import '../models/order.dart';
import '../utils/format.dart';
import '../widgets/order_status_timeline.dart';
import '../widgets/price_row.dart';
import 'restaurant_list_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  final Order order;

  const OrderTrackingScreen({super.key, required this.order});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Timer? _timer;
  int _secondsElapsed = 0;

  @override
  void initState() {
    super.initState();
    _startStatusUpdates();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Simulates order status progression with a timer.
  void _startStatusUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _secondsElapsed += 5;
        if (_secondsElapsed == 5 && widget.order.status == OrderStatus.preparing) {
          widget.order.status = OrderStatus.onTheWay;
          _showStatusSnackBar(AppStrings.statusOnTheWay);
        } else if (_secondsElapsed == 10 && widget.order.status == OrderStatus.onTheWay) {
          widget.order.status = OrderStatus.delivered;
          _timer?.cancel();
          _showStatusSnackBar(AppStrings.statusDelivered);
        }
      });
    });
  }

  // Shows a SnackBar with the status message.
  void _showStatusSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
        ),
        margin: const EdgeInsets.all(AppDimens.spaceLg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.orderTracking),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: AppDimens.paddingAllLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: AppDimens.paddingAllLg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: AppColors.success, size: AppDimens.iconSizeXl),
                        SizedBox(width: AppDimens.spaceMd),
                        Expanded(
                          child: Text(
                            AppStrings.orderConfirmed,
                            style: TextStyle(
                              fontSize: AppDimens.fontSizeXxl,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spaceMd),
                    Text(
                      'Order #${widget.order.id}',
                      style: const TextStyle(
                        fontSize: AppDimens.fontSizeMd,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spaceXl),
            const Text(
              AppStrings.orderStatus,
              style: TextStyle(
                fontSize: AppDimens.fontSizeXl,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimens.spaceLg),
            OrderStatusTimeline(order: widget.order),
            const SizedBox(height: AppDimens.spaceXl),
            Card(
              child: Padding(
                padding: AppDimens.paddingAllLg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.order.statusText,
                          style: const TextStyle(
                            fontSize: AppDimens.fontSizeXl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.paddingMd,
                            vertical: AppDimens.paddingXs + 2,
                          ),
                          decoration: BoxDecoration(
                            color: widget.order.status.color.withValues(alpha: 0.2),
                            borderRadius:
                                BorderRadius.circular(AppDimens.radiusLg),
                          ),
                          child: Text(
                            widget.order.estimatedTime,
                            style: TextStyle(
                              color: widget.order.status.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spaceLg),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLight,
                        borderRadius:
                            BorderRadius.circular(AppDimens.radiusSm),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            widget.order.status.icon,
                            size: 80,
                            color: widget.order.status.color,
                          ),
                          const SizedBox(height: AppDimens.spaceLg),
                          Text(
                            widget.order.status.message,
                            style: const TextStyle(
                              fontSize: AppDimens.fontSizeLg,
                              color: AppColors.textMutedDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spaceXl),
            const Text(
              AppStrings.orderDetails,
              style: TextStyle(
                fontSize: AppDimens.fontSizeXl,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimens.spaceMd),
            Card(
              child: Padding(
                padding: AppDimens.paddingAllLg,
                child: Column(
                  children: [
                    ...widget.order.items.map((item) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: AppDimens.cardMarginBottomSm),
                          child: Row(
                            children: [
                              Text(
                                '${item.quantity}x',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: AppDimens.spaceSm),
                              Expanded(
                                child: Text(item.menuItem.name),
                              ),
                              Text(
                                Format.price(item.totalPrice),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )),
                    const Divider(),
                    PriceRow(label: AppStrings.subtotal, amount: widget.order.subtotal),
                    PriceRow(label: AppStrings.deliveryFee, amount: widget.order.deliveryFee),
                    const SizedBox(height: AppDimens.spaceSm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.total,
                          style: TextStyle(
                            fontSize: AppDimens.fontSizeXl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Format.price(widget.order.total),
                          style: const TextStyle(
                            fontSize: AppDimens.fontSizeXl,
                            fontWeight: FontWeight.bold,
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimens.spaceXl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RestaurantListScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textMuted,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.buttonPaddingVertical),
                ),
                child: const Text(
                  AppStrings.backToHome,
                  style: TextStyle(fontSize: AppDimens.fontSizeLg),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
