import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/wallet_page.dart';
import 'package:retip/utils/app_colors.dart';

class WalletBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => WalletPage())),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "Get 1% cash back on select transactions",
                style: TextStyle(
                  color: Colors.white,
                  height: 1.6,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 12),
            Image.asset(
              "assets/retip_logo.png",
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}
