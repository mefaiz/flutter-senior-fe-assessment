/// App-wide string constants.
class AppStrings {
  AppStrings._();

  // App
  static const String appTitle = 'Food Delivery';

  // Screens
  static const String checkout = 'Checkout';
  static const String orderTracking = 'Order Tracking';

  // Actions
  static const String add = 'Add to Cart';
  static const String placeOrder = 'Place Order';
  static const String backToHome = 'Back to Home';

  // Cart & checkout
  static const String yourCartIsEmpty = 'Your cart is empty';
  static const String subtotal = 'Subtotal';
  static const String deliveryFee = 'Delivery Fee';
  static const String total = 'Total';
  static const String orderConfirmed = 'Order Confirmed!';
  static const String orderStatus = 'Order Status';
  static const String orderDetails = 'Order Details';

  // Order status timeline
  static const String orderPlaced = 'Order Placed';
  static const String preparing = 'Preparing';
  static const String delivered = 'Delivered';

  // Order status messages
  static const String statusPreparing = 'Your food is being prepared';
  static const String statusOnTheWay = 'Driver is on the way';
  static const String statusDelivered = 'Enjoy your meal!';

  // Snackbar
  static String addedToCart(String itemName) => '$itemName added to cart';
}
