import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/review.dart';
import 'package:retip/pages/help_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/common/star_rating.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';
import 'package:retip/widgets/tips/radio_button_group.dart';

class NewReviewPage extends StatefulWidget {
  Review? review;

  NewReviewPage({Key? key, this.review}) : super(key: key);

  @override
  State<NewReviewPage> createState() => _NewReviewPageState();
}

class _NewReviewPageState extends State<NewReviewPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.review == null) {
      widget.review = Review(stars: 0, date: DateTime.now());
    }

    super.initState();
  }

  void finishReview() {
    widget.review!.comment = controller.text;

    Navigator.pop(context, widget.review);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: mediaQueryData.size.height * 0.3,
                width: mediaQueryData.size.width,
                child: Container(
                  color: AppColors.primaryLight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular((mediaQueryData.size.width * 0.25) / 2)),
                        child: Image.asset(
                          "assets/placeholders/profile3.jpeg",
                          width: mediaQueryData.size.width * 0.25,
                          height: mediaQueryData.size.width * 0.25,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("Robert Maxwell", style: AppTextStyles.sectionHeader),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: CloseIconButton(
                    color: AppColors.accent,
                  ),
                ),
                top: 24,
                right: 24,
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Review", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 8),
                  StarRating(
                    rating: widget.review!.stars,
                    size: 40,
                    isEditable: true,
                    onEdit: (rating) {
                      widget.review!.stars = rating;
                    },
                  ),
                  SizedBox(height: 16),
                  Text("Comments", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: RadioButtonGroup(items: ['Bad Service'], onSelected: (_) {})),
                      SizedBox(width: 16),
                      Expanded(child: RadioButtonGroup(items: ['Friendly Waiter'], onSelected: (_) {})),
                    ],
                  ),
                  SizedBox(height: 16),
                  BigRoundedTextField(
                    hint: 'Additional comments',
                    controller: controller,
                  ),
                  Spacer(),
                  RoundedButton(
                    text: "Done",
                    textColor: Colors.white,
                    color: (widget.review?.stars ?? 0) > 0 ? AppColors.accent : AppColors.accentLight,
                    onPressed: finishReview,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
