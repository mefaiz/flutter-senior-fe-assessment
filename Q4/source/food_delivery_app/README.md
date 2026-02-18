# Food Delivery App

A Flutter-based food delivery application with 4 main screens: Restaurant List, Food Menu, Checkout, and Order Tracking.

## Features

- **Restaurant List**: Browse 6 different restaurants with ratings and cuisine types
- **Food Menu**: View menu items with prices and descriptions, add items to cart
- **Shopping Cart**: Real-time cart updates with badge counter
- **Checkout**: Review order, adjust quantities, see subtotal and delivery fee
- **Order Tracking**: Track order status with automatic progression and visual timeline

## Project Structure

```
lib/
├── main.dart                 # App entry point with Provider setup
├── constants/
│   ├── app_strings.dart      # Screen titles, labels, messages
│   ├── app_dimens.dart       # Padding, spacing, font sizes, radii
│   └── app_colors.dart      # Primary, status, muted, primaryLight (SnackBar)
├── utils/
│   └── format.dart          # Format.price(double) for currency
├── extensions/
│   └── order_status_extension.dart  # OrderStatus → color, icon, message
├── models/
│   ├── restaurant.dart      # Restaurant and MenuItem models
│   ├── cart_item.dart       # Cart item model
│   └── order.dart           # Order model with status enum
├── screens/
│   ├── restaurant_list_screen.dart  # Home screen with restaurant list
│   ├── menu_screen.dart             # Restaurant menu with add to cart
│   ├── checkout_screen.dart         # Cart review and order placement
│   └── order_tracking_screen.dart  # Order status tracking
├── widgets/
│   ├── network_image_rounded.dart  # Cached network image with placeholder/error
│   ├── cart_icon_button.dart       # AppBar cart icon + badge, navigates to checkout
│   ├── app_bar_back.dart           # Reusable back button for AppBar.leading
│   ├── rating_row.dart             # Star icon + rating value
│   ├── empty_state.dart           # Centered icon + message (e.g. empty cart)
│   ├── order_status_timeline.dart # Order tracking: Order Placed → Preparing → Delivered
│   └── price_row.dart             # Label + formatted price row (e.g. subtotal, delivery fee)
└── data/
    ├── mock_data.dart       # Mock restaurant and menu data (Picsum URLs)
    └── cart_provider.dart   # State management for cart
```

## Technologies Used

- **Flutter**: UI framework
- **Provider**: State management for cart functionality
- **Dart**: Programming language

## Mock Data

The app includes 6 restaurants with different cuisines:
1. Italian Bistro (Italian)
2. Sushi Palace (Japanese)
3. Burger House (American)
4. Taco Fiesta (Mexican)
5. Thai Kitchen (Thai)
6. Indian Spice (Indian)

Each restaurant has 8 menu items with prices and descriptions. **Images are for illustration only** — they are loaded from [Picsum Photos](https://picsum.photos/) (placeholder service) using seeds based on restaurant and item names (e.g. `italian-bistro`, `burger-house-classic-burger`). They are not real photos of the dishes or venues.

## Running the App

### Prerequisites

- **FVM** (Flutter Version Management) — [fvm.app](https://fvm.app). The project uses Flutter **3.32.8** via FVM (see `.fvmrc`).
- **iOS**: Xcode + simulator.
- **Android**: Android Studio, SDK, emulator, and **Java 17+** (required for this project’s Gradle setup).

### Quick start (from this directory)

```bash
fvm install                    # installs Flutter 3.32.8 if needed
fvm flutter pub get

# Then run on a device (pick one):
fvm flutter run -d chrome       # web
fvm flutter run -d ios          # iOS simulator
fvm flutter run -d android      # Android emulator
```

Use `fvm flutter devices` to list available devices. First Android build may take a few minutes.

## Key Implementation Details

### State Management
- Uses Provider for cart state management
- CartProvider manages: adding items, removing items, updating quantities, calculating totals
- Real-time UI updates when cart changes

### Navigation
- Uses MaterialPageRoute for screen navigation
- Proper back navigation handling
- Cart accessible from multiple screens

### Order Tracking
- Simulates order progression with Timer
- Status changes: Preparing (5s) → On the way (5s) → Delivered
- **OrderStatusTimeline** widget: horizontal timeline (Order Placed → Preparing → Delivered) with step circles and connecting lines
- SnackBar shown when status changes to “On the way” and “Delivered”

### Constants, extensions & reusable widgets
- **Constants**: `AppStrings`, `AppDimens`, `AppColors` used across screens for consistency
- **Extensions**: **`OrderStatusExtension`** on `OrderStatus` provides `.color`, `.icon`, and `.message` for the order tracking screen (single place for status presentation mapping)
- **Widgets**: `CartIconButton` (restaurant list + menu AppBars), `AppBarBack` (menu + checkout), `RatingRow`, `EmptyState` (empty cart), `NetworkImageRounded`, **OrderStatusTimeline** (order tracking steps), **PriceRow** (label + price, e.g. in order details)
- **Format**: `Format.price(double)` for all currency display

### UI Design
- Minimal, clean design with Material Design 3
- Card-based layouts for better organization
- Network images (Picsum) with caching — for illustration only, not real food/restaurant photos
- **Add-to-cart SnackBar**: Floating, light green background (`AppColors.primaryLight`), black semi-bold text
- Responsive layouts that work on web and mobile

## Future Enhancements

- Backend integration for real restaurant data
- User authentication
- Payment processing
- Real-time order tracking with maps
- Order history
- Restaurant search and filters
- Favorites functionality
