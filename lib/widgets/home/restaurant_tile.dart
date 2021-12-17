import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/restaurant.dart';
import 'package:retip/pages/restaurants/restaurant_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/common/star_rating.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTile({Key? key, required this.restaurant}) : super(key: key);

  void showRestaurant(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (_) => RestaurantPage(restaurant)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showRestaurant(context),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(restaurant.imageUrl),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
                clipBehavior: Clip.antiAlias,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 8, bottom: 8, top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: StarRating(
                    rating: restaurant.rating.ceil(),
                    size: 16,
                    filledColor: Colors.white,
                    emptyColor: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            restaurant.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
