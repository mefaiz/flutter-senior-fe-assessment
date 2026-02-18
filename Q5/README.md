# Q5 — AI-Generated Voucher App

## Overview
This folder contains a Flutter voucher selection and QR code payment app generated using AI tools.

## Approach

1. **Project structure:** `lib/constants/` (AppStrings, AppDimens, AppColors), `lib/utils/` (Format.price, SnackBar helper), `lib/extensions/` (VoucherItem display), `lib/models/`, `lib/data/` (mock vouchers, SelectionProvider), `lib/screens/`, `lib/widgets/`.
2. **State management:** Provider at root with `SelectionProvider` (single responsibility: selection state). Consumer / context.read in screens.
3. **Platforms:** iOS, Android, and web (`--platforms=ios,android,web`).
4. **Quality:** flutter_lints, `fvm flutter analyze` clean. AppBar (scrolledUnderElevation: 0, surfaceTintColor: transparent), CardThemeData, Color.withValues(alpha:) where needed.

## Structure
- `prompt.md` - Main prompt and refinements
- `source/voucher_app/` - Flutter project (compile and run with FVM)
- `recording/README.md` - Demo link and one-line description (no large video files committed)

## Functional Requirements
- **No authentication** - App opens directly to voucher list
- **Voucher List** - $2 (qty 2), $5 (qty 2), $10 (qty 2); each instance individually selectable
- **Pay button** - Visible at bottom; grey when none selected (tap shows SnackBar); when selected, navigates to QR screen
- **QR Code Screen** - QR data = comma-separated amounts (e.g. "2,2,10"); total as text (e.g. "$14"); Back in bottom bar

### Prerequisites

- **FVM** (Flutter Version Management): [fvm.app](https://fvm.app) — `brew install fvm` or `dart pub global activate fvm`
- **Flutter 3.32.8** — FVM will install it on first run (see below)
- **iOS**: Xcode and an iOS simulator
- **Android**: Android Studio, SDK, and an emulator; **Java 17** or later (required for Gradle 8.x)

### Steps

```bash
# 1. Clone the repo (if you haven't already)
git clone <repo-url>
cd flutter-senior-fe-assessment

# 2. Go to the app and install Flutter version + dependencies
cd Q5/source/voucher_app
fvm install                    # installs Flutter 3.32.8 if needed
fvm flutter pub get

# 3. Run the app (pick one)
fvm flutter run -d chrome        # web
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

The app has its own `.fvmrc` in `source/voucher_app/`. Always use **`fvm`** for Flutter commands (e.g. `fvm flutter run -d ios`). Android builds require **Java 17+** to match the Gradle/AGP setup above.

See `source/voucher_app/README.md` for project structure and main decisions.
