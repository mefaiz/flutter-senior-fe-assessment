import '../models/voucher.dart';
import '../utils/format.dart';

/// Presentation for [VoucherItem]: formatted amount label.
extension VoucherItemExtension on VoucherItem {
  String get displayAmount => Format.price(amount);
}
