import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/selection_provider.dart';
import '../models/voucher.dart';
import '../extensions/voucher_item_extension.dart';
import '../utils/format.dart';
import '../widgets/primary_button.dart';
import '../widgets/empty_state.dart';
import '../utils/snackbar_helper.dart';
import 'qr_code_screen.dart';

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.voucherList),
      ),
      body: Consumer<SelectionProvider>(
        builder: (context, selection, child) {
          final vouchers = selection.allVouchers;
          if (vouchers.isEmpty) {
            return const EmptyState(
              icon: Icons.card_giftcard_outlined,
              message: AppStrings.selectVouchers,
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: AppDimens.paddingAllLg,
                  itemCount: vouchers.length,
                  itemBuilder: (context, index) {
                    final voucher = vouchers[index];
                    return _VoucherCard(
                      voucher: voucher,
                      isSelected: selection.isSelected(voucher.id),
                      onTap: () => selection.toggle(voucher.id),
                    );
                  },
                ),
              ),
              Container(
                padding: AppDimens.paddingAllLg,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                        const Text(
                          AppStrings.total,
                          style: TextStyle(
                            fontSize: AppDimens.fontSizeXl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Format.price(selection.total),
                          style: const TextStyle(
                            fontSize: AppDimens.fontSizeXl,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.spaceLg),
                    PrimaryButton(
                      label: AppStrings.pay,
                      enabled: true,
                      appearsDisabled: selection.selectedIds.isEmpty,
                      onPressed: () {
                        if (selection.selectedIds.isEmpty) {
                          showAppSnackBar(context, AppStrings.noVouchersSelected);
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => const QrCodeScreen(),
                          ),
                        );
                      },
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

class _VoucherCard extends StatelessWidget {
  const _VoucherCard({
    required this.voucher,
    required this.isSelected,
    required this.onTap,
  });

  final VoucherItem voucher;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDimens.cardMarginBottomSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        child: Padding(
          padding: AppDimens.paddingAllLg,
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? AppColors.primary : AppColors.textMuted,
                size: AppDimens.iconSizeLg,
              ),
              const SizedBox(width: AppDimens.spaceLg),
              Text(
                voucher.displayAmount,
                style: const TextStyle(
                  fontSize: AppDimens.fontSizeXxl,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
