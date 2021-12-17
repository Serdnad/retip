import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';
import 'package:retip/widgets/tips/radio_button_group.dart';

class NewTipPage extends StatefulWidget {
  @override
  State<NewTipPage> createState() => _NewTipPageState();
}

class _NewTipPageState extends State<NewTipPage> {
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
                    onSelected: (item) {},
                  ),
                  SizedBox(height: 16),
                  Text("CUSTOM"),
                  SizedBox(height: 24),
                  Text("Rating (optional)", style: AppTextStyles.sectionHeader),
                  Spacer(),
                  RoundedButton(
                    text: "Submit",
                    textColor: Colors.white,
                    color: AppColors.accentLight, // TODO: CHANGE
                    onPressed: () {},
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
