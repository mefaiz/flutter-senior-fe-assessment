import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/restaurant.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);

  double get deliveryFee => _items.isEmpty ? 0 : 3.99;

  double get total => subtotal + deliveryFee;

  // Add an item to the cart
  void addItem(MenuItem menuItem, String restaurantName) {
    final existingIndex = _items.indexWhere(
      (item) => item.menuItem.id == menuItem.id,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(
        menuItem: menuItem,
        restaurantName: restaurantName,
      ));
    }
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(String menuItemId) {
    _items.removeWhere((item) => item.menuItem.id == menuItemId);
    notifyListeners();
  }

  // Update the quantity of an item in the cart
  void updateQuantity(String menuItemId, int quantity) {
    if (quantity <= 0) {
      removeItem(menuItemId);
      return;
    }

    final index = _items.indexWhere(
      (item) => item.menuItem.id == menuItemId,
    );

    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  // Clear the cart
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
