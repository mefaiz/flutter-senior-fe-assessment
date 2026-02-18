import 'cart_item.dart';

enum OrderStatus {
  preparing,
  onTheWay,
  delivered,
}

class Order {
  final String id;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final DateTime orderTime;
  OrderStatus status;

  Order({
    required this.id,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.orderTime,
    this.status = OrderStatus.preparing,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.preparing:
        return 'Preparing your order';
      case OrderStatus.onTheWay:
        return 'On the way';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  String get estimatedTime {
    switch (status) {
      case OrderStatus.preparing:
        return '15-20 mins';
      case OrderStatus.onTheWay:
        return '5-10 mins';
      case OrderStatus.delivered:
        return 'Completed';
    }
  }
}
