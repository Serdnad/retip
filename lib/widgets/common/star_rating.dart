import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class StarRating extends StatefulWidget {
  int rating;
  final Color filledColor;
  final Color emptyColor;
  final double size;

  final bool isEditable;
  final Function(int rating)? onEdit;

  StarRating({
    Key? key,
    required this.rating,
    this.filledColor = AppColors.accentDark,
    this.emptyColor = AppColors.accentLight,
    this.size = 24,
    this.isEditable = false,
    this.onEdit,
  }) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  void updateRating(int rating) {
    setState(() => widget.rating = rating);

    widget.onEdit?.call(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i in [1, 2, 3, 4, 5])
          GestureDetector(
            onTap: () => updateRating(i),
            child: Icon(
              Icons.star,
              color: i <= widget.rating ? widget.filledColor : widget.emptyColor,
              size: widget.size,
            ),
          )
      ],
    );
  }
}
