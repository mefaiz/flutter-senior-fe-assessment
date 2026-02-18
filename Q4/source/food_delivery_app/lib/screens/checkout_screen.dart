import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/cart_provider.dart';
import '../models/order.dart';
import '../widgets/network_image_rounded.dart';
import '../widgets/app_bar_back.dart';
import '../widgets/empty_state.dart';
import '../utils/format.dart';
import 'order_tracking_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBack(),
        title: const Text(AppStrings.checkout),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const EmptyState(
              icon: Icons.shopping_cart_outlined,
              message: AppStrings.yourCartIsEmpty,
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: AppDimens.paddingAllLg,
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.items[index];
                    return Card(
                      margin: const EdgeInsets.only(
                          bottom: AppDimens.cardMarginBottomSm),
                      child: Padding(
                        padding: AppDimens.paddingAllMd,
                        child: Row(
                          children: [
                            NetworkImageRounded(
                              imageUrl: cartItem.menuItem.image,
                              width: AppDimens.imageSizeCartItem,
                              height: AppDimens.imageSizeCartItem,
                            ),
                            const SizedBox(width: AppDimens.spaceMd),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.menuItem.name,
                                    style: const TextStyle(
                                      fontSize: AppDimens.fontSizeLg,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: AppDimens.spaceXs),
                                  Text(
                                    cartItem.restaurantName,
                                    style: const TextStyle(
                                      fontSize: AppDimens.fontSizeSm,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: AppDimens.spaceXs),
                                  Text(
                                    Format.price(cartItem.menuItem.price),
                                    style: const TextStyle(
                                      fontSize: AppDimens.fontSizeMd,
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    cart.updateQuantity(
                                      cartItem.menuItem.id,
                                      cartItem.quantity - 1,
                                    );
                                  },
                                ),
                                Text(
                                  '${cartItem.quantity}',
                                  style: const TextStyle(
                                    fontSize: AppDimens.fontSizeLg,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    cart.updateQuantity(
                                      cartItem.menuItem.id,
                                      cartItem.quantity + 1,
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(
                              Format.price(cartItem.totalPrice),
                              style: const TextStyle(
                                fontSize: AppDimens.fontSizeLg,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: AppDimens.paddingAllLg,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(AppStrings.subtotal,
                            style: TextStyle(fontSize: AppDimens.fontSizeLg)),
                        Text(
                          Format.price(cart.subtotal),
                          style: const TextStyle(
                              fontSize: AppDimens.fontSizeLg),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spaceSm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(AppStrings.deliveryFee,
                            style: TextStyle(fontSize: AppDimens.fontSizeLg)),
                        Text(
                          Format.price(cart.deliveryFee),
                          style: const TextStyle(
                              fontSize: AppDimens.fontSizeLg),
                        ),
                      ],
                    ),
                    const Divider(height: AppDimens.spaceXl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.total,
                          style: TextStyle(
                            fontSize: AppDimens.fontSizeXxl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Format.price(cart.total),
                          style: const TextStyle(
                            fontSize: AppDimens.fontSizeXxl,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spaceLg),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final order = Order(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            items: List.from(cart.items),
                            subtotal: cart.subtotal,
                            deliveryFee: cart.deliveryFee,
                            total: cart.total,
                            orderTime: DateTime.now(),
                          );
                          cart.clear();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderTrackingScreen(order: order),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.buttonPaddingVertical),
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          AppStrings.placeOrder,
                          style: TextStyle(
                              fontSize: AppDimens.fontSizeXl,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
