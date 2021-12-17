import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final Color filledColor;
  final Color emptyColor;
  final double size;

  const StarRating({
    Key? key,
    required this.rating,
    this.filledColor = AppColors.accentDark,
    this.emptyColor = AppColors.accentLight,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i in [1, 2, 3, 4, 5])
          Icon(
            Icons.star,
            color: i <= rating ? filledColor : emptyColor,
            size: size,
          ),
      ],
    );
  }
}
