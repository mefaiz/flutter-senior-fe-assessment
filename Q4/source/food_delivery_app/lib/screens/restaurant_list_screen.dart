import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/mock_data.dart';
import '../models/restaurant.dart';
import '../widgets/network_image_rounded.dart';
import '../widgets/cart_icon_button.dart';
import '../widgets/rating_row.dart';
import 'menu_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        actions: const [CartIconButton()],
      ),
      body: ListView.builder(
        padding: AppDimens.paddingAllLg,
        itemCount: mockRestaurants.length,
        itemBuilder: (context, index) {
          final restaurant = mockRestaurants[index];
          return RestaurantCard(restaurant: restaurant);
        },
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDimens.cardMarginBottomLg),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuScreen(restaurant: restaurant),
            ),
          );
        },
        child: Padding(
          padding: AppDimens.paddingAllLg,
          child: Row(
            children: [
              NetworkImageRounded(
                imageUrl: restaurant.image,
                width: AppDimens.imageSizeRestaurantCard,
                height: AppDimens.imageSizeRestaurantCard,
              ),
              const SizedBox(width: AppDimens.spaceLg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: AppDimens.fontSizeXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spaceXs),
                    Text(
                      restaurant.cuisineType,
                      style: const TextStyle(
                        fontSize: AppDimens.fontSizeMd,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spaceSm),
                    RatingRow(rating: restaurant.rating),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
