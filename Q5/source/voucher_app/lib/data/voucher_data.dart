import '../models/voucher.dart';

/// Mock voucher list: $2 (qty 2), $5 (qty 2), $10 (qty 2).
/// Each instance has a fixed unique id (1–6) for selection.
final List<VoucherItem> mockVouchers = [
  const VoucherItem(id: '1', amount: 2),
  const VoucherItem(id: '2', amount: 2),
  const VoucherItem(id: '3', amount: 5),
  const VoucherItem(id: '4', amount: 5),
  const VoucherItem(id: '5', amount: 10),
  const VoucherItem(id: '6', amount: 10),
];
