import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/restaurant.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/common/search_bar.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/home/restaurant_tile.dart';
import 'package:retip/widgets/restaurants/text_dropdown.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> restaurants = [];
  List<Restaurant> filteredRestaurants = [];

  @override
  void initState() {
    restaurants.add(Restaurant(name: "Ze Bar", imageUrl: "assets/placeholders/rest1.jpg"));
    restaurants.add(Restaurant(name: "Eatery New York", imageUrl: "assets/placeholders/rest2.jpg"));
    restaurants.add(Restaurant(name: "IndFoo", imageUrl: "assets/placeholders/rest2.jpg"));

    restaurants.add(Restaurant(name: "El Patacon", imageUrl: "assets/placeholders/rest1.jpg"));
    restaurants.add(Restaurant(name: "Fruitcake Factory", imageUrl: "assets/placeholders/rest2.jpg"));
    restaurants.add(Restaurant(name: "IndFoo", imageUrl: "assets/placeholders/rest2.jpg"));

    restaurants.add(Restaurant(name: "Ze Bar", imageUrl: "assets/placeholders/rest1.jpg"));
    restaurants.add(Restaurant(name: "Eatery New York", imageUrl: "assets/placeholders/rest2.jpg"));
    restaurants.add(Restaurant(name: "IndFoo", imageUrl: "assets/placeholders/rest2.jpg"));

    restaurants.add(Restaurant(name: "Ze Bar", imageUrl: "assets/placeholders/rest1.jpg"));
    restaurants.add(Restaurant(name: "Eatery New York", imageUrl: "assets/placeholders/rest2.jpg"));
    restaurants.add(Restaurant(name: "IndFoo", imageUrl: "assets/placeholders/rest2.jpg"));

    filteredRestaurants = restaurants;

    super.initState();
  }

  void search(String text) {
    final term = text.toLowerCase();

    if (term.trim().isEmpty) {
      setState(() => filteredRestaurants = restaurants);
    } else {
      setState(() =>
          filteredRestaurants = restaurants.where((r) => r.name.toLowerCase().contains(term)).toList(growable: false));
    }
  }

  void sort(String method) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              BigTextHeader(title: "Restaurants", action: CloseIconButton()),
              SizedBox(height: 12),
              SearchBar(onChanged: search),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Sort by ", style: TextStyle(color: Colors.black54)),
                  TextDropdown(
                    items: ["rating", "location"],
                    onChanged: (sortMethod) {
                      switch (sortMethod) {
                        case "rating":
                          setState(() => filteredRestaurants.sort((a, b) => (100 * (b.rating - a.rating)).ceil()));
                          break;
                        default:
                          setState(() => filteredRestaurants.shuffle());
                          break;
                      }
                    },
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredRestaurants.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                  ),
                  itemBuilder: (_, index) => RestaurantTile(restaurant: filteredRestaurants[index]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
