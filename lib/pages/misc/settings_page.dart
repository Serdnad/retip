import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigTextHeader(title: "Settings", action: CloseIconButton()),
              SizedBox(height: 16),
              RoundedButton(
                text: "Account Details",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {},
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Privacy",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {},
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Location",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {},
              ),
              Spacer(),
              RoundedButton(
                text: "Log out",
                textColor: Colors.white,
                color: AppColors.accent,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
