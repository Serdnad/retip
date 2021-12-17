import 'package:flutter/material.dart';
import 'package:retip/models/review.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/common/star_rating.dart';

class ReviewItem extends StatelessWidget {
  final Review? review;
  final VoidCallback? onTap;

  const ReviewItem({
    Key? key,
    this.review,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.accentLight,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StarRating(rating: review?.stars ?? 0, emptyColor: Colors.white54),
              ],
            ),
            SizedBox(height: 12),
            Text(
              review?.comment ?? "Tap to leave a review",
              style: TextStyle(
                color: review?.comment != null ? AppColors.accentDark : AppColors.accent,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
