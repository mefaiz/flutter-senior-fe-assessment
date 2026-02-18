import 'package:flutter/material.dart';

/// Picsum Photos: fixed public API for placeholder images.
/// https://picsum.photos/
String imageUrl(int index) =>
    'https://picsum.photos/id/${index % 1000}/200/200';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q1 Naive List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ImageListScreen(),
    );
  }
}

/// NAIVE: Uses ListView(children: [...]) so all 1000 widgets are built at once.
/// Uses Image.network with no caching, no placeholder, no error handling.
class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  static const int itemCount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naive List (1000 images)'),
      ),
      body: ListView(
        children: List.generate(
          itemCount,
          (index) => ListTile(
            leading: Image.network(
              imageUrl(index),
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
            title: Text('Item ${index + 1}'),
          ),
        ),
      ),
    );
  }
}
