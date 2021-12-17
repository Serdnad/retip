import 'dart:math';

class Tip {
  double mealPrice;

  String restaurantName;

  String serverName;
  String serverImageUrl;

  DateTime date;

  Tip({
    required this.restaurantName,
    required this.serverName,
    required this.serverImageUrl,
    required this.mealPrice,
    required this.date,
  });

  // TODO: Only for testing
  static Random r = Random();

  static Tip random() {
    const names = [
      "John Weber",
      "Sarah Silver",
      "Angus Rayne",
      "Adam Olman",
      "Beatrice Fea",
    ];

    const restaurants = ["Ze Bar", "IndFoo", "El Patacon", "Eatery New York"];

    return Tip(
      restaurantName: restaurants[r.nextInt(17) % (names.length - 1)],
      serverName: names[r.nextInt(names.length)],
      serverImageUrl: "assets/placeholders/profile${r.nextInt(4) + 1}.jpeg",
      mealPrice: r.nextDouble() * 12 + 8,
      date: DateTime.now().subtract(Duration(days: r.nextInt(60))),
    );
  }
}
