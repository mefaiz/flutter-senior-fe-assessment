import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/app_strings.dart';
import '../constants/app_dimens.dart';
import '../constants/app_colors.dart';
import '../data/selection_provider.dart';
import '../utils/format.dart';
import '../widgets/price_row.dart';
import '../widgets/secondary_button.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.qrCode),
      ),
      body: Consumer<SelectionProvider>(
        builder: (context, selection, child) {
          final content = selection.qrContent;
          final totalAmount = selection.total;

          return SingleChildScrollView(
            padding: AppDimens.paddingAllXl,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppDimens.spaceXl),
                  if (content.isEmpty)
                    const Text(
                      AppStrings.noVouchersSelected,
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeLg,
                        color: AppColors.textMuted,
                      ),
                    )
                  else ...[
                    QrImageView(
                      data: content,
                      version: QrVersions.auto,
                      size: AppDimens.qrSize,
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: AppColors.primary,
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spaceXl),
                    PriceRow(
                      label: AppStrings.total,
                      priceText: Format.price(totalAmount),
                      bold: true,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppDimens.paddingAllLg,
          child: SecondaryButton(
            label: AppStrings.back,
            onPressed: () => Navigator.maybePop(context),
          ),
        ),
      ),
    );
  }
}
