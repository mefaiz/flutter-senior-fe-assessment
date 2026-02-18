import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/cart_provider.dart';
import '../screens/checkout_screen.dart';

/// AppBar action: cart icon with optional item-count badge. Taps navigate to Checkout.
class CartIconButton extends StatelessWidget {
  const CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutScreen(),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.shopping_cart, size: 30),
              if (cart.itemCount > 0)
                Positioned(
                  left: AppDimens.spaceSm,
                  child: Container(
                    padding: AppDimens.paddingAllXs,
                    decoration: BoxDecoration(
                      color: AppColors.badge,
                      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: AppDimens.badgeMinSize,
                      minHeight: AppDimens.badgeMinSize,
                    ),
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppDimens.fontSizeXs,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
