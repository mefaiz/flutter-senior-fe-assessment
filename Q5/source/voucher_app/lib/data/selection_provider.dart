import 'package:flutter/foundation.dart';
import '../models/voucher.dart';
import 'voucher_data.dart';

// Manages which voucher instances are selected. Single responsibility: selection only.
class SelectionProvider extends ChangeNotifier {
  final Set<String> _selectedIds = {};

  List<VoucherItem> get allVouchers => mockVouchers;

  Set<String> get selectedIds => Set.unmodifiable(_selectedIds);

  List<VoucherItem> get selectedItems =>
      allVouchers.where((v) => _selectedIds.contains(v.id)).toList();

  double get total =>
      selectedItems.fold(0, (sum, item) => sum + item.amount);

  // QR code content: comma-separated amounts, e.g. "2,2,10".
  String get qrContent =>
      selectedItems.map((v) => v.amount.toInt().toString()).join(',');

  bool isSelected(String id) => _selectedIds.contains(id);

  // Toggle the selection of a voucher.
  void toggle(String id) {
    if (_selectedIds.contains(id)) {
      _selectedIds.remove(id);
    } else {
      _selectedIds.add(id);
    }
    notifyListeners();
  }

  // Clear the selection of all vouchers.
  void clear() {
    _selectedIds.clear();
    notifyListeners();
  }
}
