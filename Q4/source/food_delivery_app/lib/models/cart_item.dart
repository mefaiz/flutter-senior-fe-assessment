import 'restaurant.dart';

class CartItem {
  final MenuItem menuItem;
  final String restaurantName;
  int quantity;

  CartItem({
    required this.menuItem,
    required this.restaurantName,
    this.quantity = 1,
  });

  double get totalPrice => menuItem.price * quantity;
}
