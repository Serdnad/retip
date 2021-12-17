import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/models/restaurant.dart';
import 'package:retip/models/tip.dart';
import 'package:retip/pages/enter_code_page.dart';
import 'package:retip/pages/restaurants/restaurants_page.dart';
import 'package:retip/pages/scan_page.dart';
import 'package:retip/pages/tips/tips_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/common/app_drawer.dart';
import 'package:retip/widgets/header/drawer_button.dart';
import 'package:retip/widgets/home/restaurant_tile.dart';
import 'package:retip/widgets/home/tip_list_tile.dart';
import 'package:retip/widgets/home/wallet_banner.dart';
import 'package:retip/widgets/rounded_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            BigTextHeader(title: "Hello Zaid", action: DrawerButton()),
            SizedBox(height: 24),
            WalletBanner(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Restaurant reviews", style: AppTextStyles.sectionHeader),
                SeeAllTextButton(destinationPage: RestaurantsPage()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child:
                      RestaurantTile(restaurant: Restaurant(name: "Ze Bar", imageUrl: "assets/placeholders/rest1.jpg")),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: RestaurantTile(
                      restaurant: Restaurant(name: "Eatery New York", imageUrl: "assets/placeholders/rest2.jpg")),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Last tips", style: AppTextStyles.sectionHeader),
                SeeAllTextButton(destinationPage: TipsPage()),
              ],
            ),
            SizedBox(height: 8),
            TipListTile(Tip.random()),
            TipListTile(Tip.random()),
            //
            Spacer(),
            Container(color: AppColors.accentLight, height: 1),
            SizedBox(height: 16),
            Row(
              children: [
                RoundedButton(
                  child: Icon(Icons.person),
                  color: AppColors.accentLight,
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (_) => EnterCodePage(),
                      )),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: RoundedButton(
                    text: "Scan QR Code",
                    color: AppColors.accent,
                    textColor: Colors.white,
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(fullscreenDialog: true, builder: (_) => ScanPage()),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class SeeAllTextButton extends StatelessWidget {
  final Widget destinationPage;

  const SeeAllTextButton({required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          "See all",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        color: Colors.transparent,
      ),
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => destinationPage)),
    );
  }
}
