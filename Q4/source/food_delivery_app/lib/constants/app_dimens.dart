import 'package:flutter/material.dart';

/// App-wide dimension constants (padding, margins, sizes, font sizes).
class AppDimens {
  AppDimens._();

  // Padding
  static const double paddingXs = 4;
  static const double paddingSm = 8;
  static const double paddingMd = 12;
  static const double paddingLg = 16;
  static const double paddingXl = 24;

  static const EdgeInsets paddingAllXs = EdgeInsets.all(paddingXs);
  static const EdgeInsets paddingAllSm = EdgeInsets.all(paddingSm);
  static const EdgeInsets paddingAllMd = EdgeInsets.all(paddingMd);
  static const EdgeInsets paddingAllLg = EdgeInsets.all(paddingLg);
  static const EdgeInsets paddingAllXl = EdgeInsets.all(paddingXl);

  // Spacing (SizedBox)
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 12;
  static const double spaceLg = 16;
  static const double spaceXl = 24;

  // Font sizes
  static const double fontSizeXs = 10;
  static const double fontSizeSm = 12;
  static const double fontSizeMd = 14;
  static const double fontSizeLg = 16;
  static const double fontSizeXl = 18;
  static const double fontSizeXxl = 20;
  static const double fontSizeXxxl = 24;

  // Border radius
  static const double radiusSm = 8;
  static const double radiusMd = 10;
  static const double radiusLg = 12;

  // Icon sizes
  static const double iconSizeSm = 16;
  static const double iconSizeMd = 20;
  static const double iconSizeLg = 24;
  static const double iconSizeXl = 32;
  static const double iconSizeEmptyState = 80;

  // Image / avatar sizes
  static const double imageSizeCartItem = 50;
  static const double imageSizeMenuItem = 60;
  static const double imageSizeRestaurantCard = 80;
  static const double imageSizeRestaurantHeader = 120;

  // Card
  static const double cardMarginBottomSm = 12;
  static const double cardMarginBottomLg = 16;

  // Badge (cart)
  static const double badgeMinSize = 18;

  // Button
  static const double buttonPaddingVertical = 16;
}
