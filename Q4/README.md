# Q4 — AI-Generated Food Delivery App

## Overview
This folder contains a Flutter Food Delivery app generated using AI tools.

## Approach

This project used Cursor AI (Claude Sonnet 4.5) to generate this Food Delivery app. The approach was:

1. **Initial Planning**: Created a comprehensive prompt that outlined all 4 screens and their requirements
2. **Project Structure**: Set up a clean folder structure with models, screens, widgets, and data layers
3. **State Management**: Implemented Provider for cart state management (simple and effective)
4. **Mock Data**: Created realistic mock data with 6 restaurants, each having 8 menu items; images are loaded from Picsum Photos (seeds derived from restaurant and item names)
5. **Screen Implementation**: Built all 4 screens with smooth navigation and clean UI
6. **Testing**: Ran the app on Chrome web browser/iOS simulator/Android emulator to verify functionality

The app demonstrates:
- Clean architecture with separation of concerns
- Proper state management using Provider
- Smooth navigation flow between screens
- Real-time cart updates with badge counter
- Order status simulation with automatic progression
- Minimal, user-friendly UI design
- **Code organization**: Shared constants (strings, dimensions, colors), reusable widgets (cart icon, back button, rating row, empty state), and a price formatter

## Structure
- `prompt.md` - Exact prompt(s) used with the AI tool (include tool name and iterative refinements)
- `source/` - Complete generated Flutter project (must compile and run)
- `recording/` - Screen recording demonstrating the app running

## App Screens
1. **Restaurant List** - Display restaurants with name, image, rating, and cuisine type
2. **Food Menu** - Show menu items with name, image, price, and "Add to Cart" button
3. **Checkout** - Display selected items, quantities, subtotal, delivery fee, and total with "Place Order" button
4. **Order Tracking** - Show order status and progress indicator after placing order

## Progress indicator (Order Tracking)

After **Place Order**, the app shows a tracking screen with **order status** and a **progress indicator**

- **What it is:** A horizontal timeline with three steps: **Order Placed** → **Preparing** → **Delivered**. Each step is a circle with an icon; steps are connected by a line. The current step is green; completed steps stay green; upcoming steps are grey. Implemented as a widget class **`OrderStatusTimeline`** in `lib/widgets/order_status_timeline.dart`.
- **How it updates:** A timer runs every 5 seconds and advances the order status: 0–5s “Preparing”, 5–10s “On the way”, 10s+ “Delivered” (then the timer stops). The timeline and status message update automatically via `setState()`. A floating SnackBar is shown when the status changes to “On the way” and “Delivered”.
- **Purpose:** Time-based simulation for demo (no backend). Full implementation details are in `source/food_delivery_app/README.md`.

## Why Provider?

Provider was chosen for cart state management because:

- **Scope**: Only cart state was needed (add/remove/quantity/totals). No auth or complex flows.
- **Simplicity**: Single `ChangeNotifier` (CartProvider) and `Consumer`/`context.read` — minimal boilerplate.
- **Fit**: Recommended in Flutter docs, widely used, and sufficient for this app’s needs.
- **Alternatives considered**: Riverpod (more powerful but heavier for this size), Bloc (more structure than needed), setState (would require passing cart down everywhere).

For a larger app with more global state, Riverpod or Bloc would be better.

### Prerequisites

- **FVM** (Flutter Version Management): [fvm.app](https://fvm.app) — `brew install fvm` or `dart pub global activate fvm`
- **Flutter 3.32.8** — FVM will install it on first run (see below)
- **iOS**: Xcode and an iOS simulator
- **Android**: Android Studio, SDK, and an emulator; **Java 17** or later (required for Gradle 8.x)

### Steps

```bash
# 1. Clone the repo (if you haven’t already)
git clone <repo-url>
cd rushowl

# 2. Go to the app and install Flutter version + dependencies
cd Q4/source/food_delivery_app
fvm install                    # installs Flutter 3.32.8 if needed
fvm flutter pub get

# 3. Run the app (pick one)
fvm flutter run -d chrome      # web
fvm flutter run -d ios          # iOS simulator
fvm flutter run -d android      # Android emulator
```

First Android build can take a few minutes (Gradle/NDK). List devices with `fvm flutter devices`.

## Versions (build environment)

| Tool / dependency | Version |
|-------------------|--------|
| **Flutter** (FVM) | 3.32.8 (stable) |
| **Dart** | 3.8.1 |
| **Java** (Android) | 17 (source/target) |
| **Gradle** | 8.7 |
| **Android Gradle Plugin** | 8.3.0 |
| **Kotlin** | 1.9.22 |

The app has its own `.fvmrc` in `source/food_delivery_app/`. Always use **`fvm`** for Flutter commands (e.g. `fvm flutter run -d ios`). Android builds require **Java 17+** to match the Gradle/AGP setup above.

## Images

**All images in this app are for illustration only.** Restaurant and menu images are loaded from [Picsum Photos](https://picsum.photos/) (placeholder service). Seeds are derived from restaurant and item names (e.g. `italian-bistro`, `sushi-palace-margherita-pizza`) for stable, cacheable URLs. They are not real photos of the dishes or venues.

## Code organization (source app)

The app uses shared **constants** (`lib/constants/`: `app_strings.dart`, `app_dimens.dart`, `app_colors.dart`), a **format** helper (`lib/utils/format.dart` for prices), **extensions** (`lib/extensions/`: **`OrderStatusExtension`** — maps `OrderStatus` to color, icon, and message for the tracking screen), and **reusable widgets** (`lib/widgets/`): `CartIconButton`, `AppBarBack`, `RatingRow`, `EmptyState`, `NetworkImageRounded`, **`OrderStatusTimeline`** (order tracking steps), **`PriceRow`** (label + formatted price). Add-to-cart and order-status feedback use a floating SnackBar with light green background and black bold text.

## Notes

- App uses mock/hardcoded data (no backend integration required)
