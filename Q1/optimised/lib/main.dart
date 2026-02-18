import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Picsum Photos: fixed public API for placeholder images.
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
      title: 'Q1 Optimised List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ImageListScreen(),
    );
  }
}

/// OPTIMISED: ListView.builder (lazy), CachedNetworkImage, placeholder/error,
/// RepaintBoundary per item, fixed image dimensions.
class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  static const int itemCount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Optimised List (1000 images)'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return RepaintBoundary(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: imageUrl(index),
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey[300],
                  child: const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image_outlined),
                ),
              ),
              title: Text('Item ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
