import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/wallet_page.dart';
import 'package:retip/utils/app_colors.dart';

class SelectedPaymentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => WalletPage())),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset("assets/visa.png", height: 24),
            SizedBox(width: 8),
            Text(
              "**** 5623",
              style: TextStyle(
                color: AppColors.accentDark,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.accentDark),
          ],
        ),
      ),
    );
  }
}
