import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/help_page.dart';
import 'package:retip/pages/restaurants/restaurants_page.dart';
import 'package:retip/pages/misc/settings_page.dart';
import 'package:retip/pages/tips/tips_page.dart';
import 'package:retip/pages/wallet_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/rounded_button.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset("assets/logo.png"),
              ),
              RoundedButton(
                text: "Restaurants",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => RestaurantsPage()));
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Your tips",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => TipsPage()));
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Wallet",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => WalletPage()));
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Settings",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => SettingsPage()));
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                text: "Help",
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => HelpPage()));
                },
              ),
              Spacer(),
              Text("v1.0.0", style: AppTextStyles.sectionHeader, textAlign: TextAlign.end)
            ],
          ),
        ),
      ),
    );
  }
}
