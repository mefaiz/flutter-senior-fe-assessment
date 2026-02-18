# Voucher App

A Flutter app for selecting vouchers and displaying a QR code with comma-separated amounts and total.

## Features

- **Voucher list:** 6 vouchers ($2×2, $5×2, $10×2); tap to select/deselect each instance
- **Pay:** Primary button shows total; grey when none selected (tap shows SnackBar); when selected, navigates to QR screen with a short SnackBar
- **QR code screen:** QR content = selected amounts as "2,2,10"; total as e.g. "$14"; Back button in bottom bar (secondary style)

## Project structure

```
lib/
├── main.dart                 # App entry, Provider setup
├── constants/
│   ├── app_strings.dart
│   ├── app_dimens.dart
│   └── app_colors.dart
├── utils/
│   ├── format.dart           # Format.price(double)
│   └── snackbar_helper.dart  # Consistent floating SnackBar
├── extensions/
│   └── voucher_item_extension.dart  # VoucherItem.displayAmount
├── models/
│   └── voucher.dart          # VoucherItem(id, amount)
├── data/
│   ├── voucher_data.dart     # Mock list of 6 vouchers
│   └── selection_provider.dart  # Selected ids, total, qrContent
├── screens/
│   ├── voucher_list_screen.dart
│   └── qr_code_screen.dart
└── widgets/
    ├── app_bar_back.dart
    ├── empty_state.dart
    ├── primary_button.dart
    ├── secondary_button.dart
    └── price_row.dart
```

## Main decisions

- **Provider:** Single `SelectionProvider` for selection state (toggle, selectedItems, total, qrContent). No cart or auth.
- **IDs:** Voucher instances use fixed unique ids (1–6) in mock data.
- **QR content:** Plain string of comma-separated amounts (e.g. "2,2,10") via `qr_flutter`.
- **Buttons:** Primary = indigo; secondary (Back) = grey outline.
- **SnackBar:** Floating, consistent style (primaryLight background, bold text) via `showAppSnackBar`.

## Running

From this directory:

```bash
fvm install
fvm flutter pub get
fvm flutter run -d ios    # or -d android
```

