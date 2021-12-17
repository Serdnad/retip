import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/review.dart';
import 'package:retip/pages/home_page.dart';
import 'package:retip/pages/tips/new_review_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/common/review_item.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';
import 'package:retip/widgets/rounded_text_field.dart';
import 'package:retip/widgets/tips/radio_button_group.dart';
import 'package:retip/widgets/tips/selected_payment_row.dart';

class NewTipPage extends StatefulWidget {
  @override
  State<NewTipPage> createState() => _NewTipPageState();
}

class _NewTipPageState extends State<NewTipPage> {
  int? selectedTipAmount;
  TextEditingController tipController = TextEditingController();

  Review? review;

  @override
  void initState() {
    // review = Review(stars: 0, date: DateTime.now());

    super.initState();
  }

  Future<void> editReview() async {
    review = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => NewReviewPage(review: review)),
    );

    setState(() {});
  }

  void selectTip(String selection) {
    String percent = selection.substring(0, 2);
    setState(() {
      selectedTipAmount = int.parse(percent);
      tipController.text = '\$${(25.45 * (selectedTipAmount! / 100))}';
    });
  }

  void submit() {
    // TODO: submit

    Navigator.push(context, CupertinoPageRoute(builder: (_) => HomePage()));
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
                  Text("Tip amount", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 16),
                  RadioButtonGroup(
                    items: ['15%', '20%', '25%'],
                    onSelected: selectTip,
                  ),
                  SizedBox(height: 16),
                  RoundedTextField(
                    color: AppColors.accentLight,
                    hint: "Tip Amount",
                    controller: tipController,
                  ),
                  SizedBox(height: 24),
                  Text("Rating (optional)", style: AppTextStyles.sectionHeader),
                  SizedBox(height: 16),
                  ReviewItem(review: review, onTap: editReview),
                  //    final mediaQueryData = MediaQuery.of(context);

                  Spacer(),
                  SelectedPaymentRow(),
                  SizedBox(height: 16),
                  RoundedButton(
                    text: "Submit",
                    textColor: Colors.white,
                    color: selectedTipAmount == null ? AppColors.accentLight : AppColors.accent,
                    onPressed: submit,
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
