import 'package:flutter/material.dart';

/// Reusable back button for AppBar.leading.
class AppBarBack extends StatelessWidget {
  const AppBarBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.maybePop(context),
    );
  }
}
