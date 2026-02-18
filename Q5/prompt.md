# Q5: AI-Generated Voucher App — Prompt Log

## Tool Used
**Cursor AI** (Model: Sonnet 4.5)

## 1. Initial "Master" Prompt

**Prompt:**
> Create a complete Flutter Voucher App. Use a clean, production-ready structure:
>
> **Project structure:**
> - Folders: lib/constants/, lib/utils/, lib/extensions/, lib/models/, lib/data/, lib/screens/, lib/widgets/.
> - Constants: AppStrings, AppDimens, AppColors in lib/constants/.
> - Utils: Format.price() in lib/utils/format.dart; optional helper for consistent SnackBars in lib/utils/.
> - Extensions: Dart extensions for presentation (e.g. voucher → display label) in lib/extensions/.
> - Widgets: Reusable UI (buttons, app bar, empty state, price row) in lib/widgets/.
>
> **State management:** Provider at the root for selection state; Consumer / context.read in the tree. Single responsibility per provider (selection only).
>
> **Flutter / platform:**
> - FVM: Run via fvm (e.g. fvm flutter run -d ios). Enable only iOS and Android.
> - AppBar: scrolledUnderElevation: 0, surfaceTintColor: Colors.transparent. Use CardThemeData (not CardTheme). Prefer Color.withValues(alpha: x) over withOpacity.
> - IDs: For unique voucher instance IDs use fixed ids (e.g. 1, 2, 3, … 6).
> - Buttons: Primary = main color; secondary (Back, Cancel) = grey style. SnackBars: floating, consistent style (e.g. primaryLight background, bold text).
>
> **Functional requirements:**
> - No authentication; app opens to main screen.
> - **Voucher List:** Display vouchers: $2 (qty 2), $5 (qty 2), $10 (qty 2). User can select one or more vouchers (each instance individually selectable).
> - **Pay button:** Clearly visible; grey when nothing selected (tap shows SnackBar asking to select); when at least one selected, proceed to payment/QR screen.
> - **QR Code Screen:** After tapping Pay (with selection), show QR code with content = plain-text comma-separated selected amounts (e.g. 2× $2 and 1× $10 → "2,2,10"), and total amount as text (e.g. "$14"). Back button in bottom navigation bar.
>
> Include README at task level (Q5/README.md) and inside the app (Q5/source/voucher_app/README.md), prompt.md, and recording/README.md with demo link and one-line description. Use flutter_lints and run fvm flutter analyze.

---

## 2. Iterative Refinements

### Refinement 1: Pay button and empty selection
- **Prompt:** If the user doesn’t select any voucher and taps Pay, show a SnackBar (e.g. “Select at least one voucher”). Keep the Pay button grey when nothing is selected, but still tappable so the SnackBar can be shown.
- **Result:** Pay button uses `appearsDisabled` when `selection.selectedIds.isEmpty`; on tap with empty selection we show `showAppSnackBar(context, AppStrings.noVouchersSelected)` and return; otherwise navigate to QR screen.

### Refinement 2: Back button on QR screen
- **Prompt:** Move the Back button on the QR code screen into the bottom navigation bar (not in the AppBar or body).
- **Result:** Removed `AppBarBack` from the AppBar; added `Scaffold.bottomNavigationBar` with `SafeArea` and `SecondaryButton` for Back.

### Refinement 3: Voucher IDs
- **Prompt:** Use fixed voucher IDs (e.g. 1, 2, 3, … 6) instead of timestamp-based IDs.
- **Result:** `mockVouchers` in `voucher_data.dart` is now a final list with ids `'1'`–`'6'`. `SelectionProvider.allVouchers` returns `mockVouchers` directly.
