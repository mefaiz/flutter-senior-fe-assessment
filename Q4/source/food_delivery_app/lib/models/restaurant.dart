class Restaurant {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String cuisineType;
  final List<MenuItem> menuItems;

  const Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.cuisineType,
    required this.menuItems,
  });
}

class MenuItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  const MenuItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}
