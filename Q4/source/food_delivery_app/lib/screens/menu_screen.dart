import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/cart_provider.dart';
import '../models/restaurant.dart';
import '../widgets/network_image_rounded.dart';
import '../widgets/cart_icon_button.dart';
import '../widgets/rating_row.dart';
import '../widgets/app_bar_back.dart';
import '../utils/format.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;

  const MenuScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBack(),
        title: Text(restaurant.name),
        actions: const [CartIconButton()],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: AppDimens.paddingAllXl,
            decoration: const BoxDecoration(
              color: AppColors.surfaceLight,
            ),
            child: Column(
              children: [
                NetworkImageRounded(
                  imageUrl: restaurant.image,
                  width: AppDimens.imageSizeRestaurantHeader,
                  height: AppDimens.imageSizeRestaurantHeader,
                  borderRadius: AppDimens.radiusLg,
                ),
                const SizedBox(height: AppDimens.spaceMd),
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: AppDimens.fontSizeXxxl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppDimens.spaceXs),
                Text(
                  restaurant.cuisineType,
                  style: const TextStyle(
                    fontSize: AppDimens.fontSizeLg,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: AppDimens.spaceSm),
                RatingRow(
                  rating: restaurant.rating,
                  iconSize: AppDimens.iconSizeMd,
                  fontSize: AppDimens.fontSizeLg,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: AppDimens.paddingAllLg,
              itemCount: restaurant.menuItems.length,
              itemBuilder: (context, index) {
                final item = restaurant.menuItems[index];
                return MenuItemCard(
                  menuItem: item,
                  restaurantName: restaurant.name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final String restaurantName;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDimens.cardMarginBottomSm),
      child: Padding(
        padding: AppDimens.paddingAllMd,
        child: Row(
          children: [
            NetworkImageRounded(
              imageUrl: menuItem.image,
              width: AppDimens.imageSizeMenuItem,
              height: AppDimens.imageSizeMenuItem,
            ),
            const SizedBox(width: AppDimens.spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: AppDimens.fontSizeLg,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spaceXs),
                  Text(
                    menuItem.description,
                    style: const TextStyle(
                      fontSize: AppDimens.fontSizeSm,
                      color: AppColors.textMuted,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppDimens.spaceSm),
                  Text(
                    Format.price(menuItem.price),
                    style: const TextStyle(
                      fontSize: AppDimens.fontSizeLg,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppDimens.spaceSm),
            ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addItem(menuItem, restaurantName);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppStrings.addedToCart(menuItem.name),
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: AppColors.primaryLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                    ),
                    margin:
                        const EdgeInsets.all(AppDimens.spaceLg),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingMd,
                  vertical: AppDimens.paddingSm,
                ),
              ),
              child: const Text(AppStrings.add),
            ),
          ],
        ),
      ),
    );
  }
}
