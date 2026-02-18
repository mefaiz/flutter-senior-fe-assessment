/// Formatting utilities.
class Format {
  Format._();

  /// Formats a price as e.g. "$12.99".
  static String price(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }
}
