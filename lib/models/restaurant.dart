import 'dart:math';

class Restaurant {
  String name;
  String imageUrl;

  double rating = Random().nextDouble() * 4 + 1;
  int reviews = 17;

  Restaurant({required this.name, required this.imageUrl});
}
