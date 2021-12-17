import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/restaurant.dart';
import 'package:retip/models/review.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/common/review_item.dart';
import 'package:retip/widgets/common/star_rating.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantPage(this.restaurant, {Key? key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: mediaQueryData.size.height * 0.3,
                width: mediaQueryData.size.width,
                child: Image.asset(
                  "assets/placeholders/rest2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                left: 0,
                right: 0,
                bottom: 0,
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CloseIconButton(color: Colors.white),
                  ),
                ),
                top: 0,
                left: 0,
                right: 0,
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Restaurant Links", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: RoundedButton(
                          text: "Website",
                          color: AppColors.accentLight,
                          textColor: AppColors.accentDark,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: RoundedButton(
                          text: "Directions",
                          color: AppColors.accentLight,
                          textColor: AppColors.accentDark,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text("Comments and reviews (${widget.restaurant.reviews})", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 8),
                  StarRating(rating: widget.restaurant.rating.floor()),
                  SizedBox(height: 8),
                  Container(
                    height: 1,
                    color: AppColors.accentLight,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.restaurant.reviews,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (_, index) {
                        final review = Review.random();

                        // TODO: ONLY DO REVIEWS WITH COMMENTS
                        return ReviewItem(review: review);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
