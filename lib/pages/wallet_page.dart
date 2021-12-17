import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/utils/app_text_styles.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';
import 'package:retip/widgets/wallet/payment_method_button.dart';

class WalletPage extends StatefulWidget {
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List methods = [
    {
      'number': '**** 5623',
    },
    {
      'number': '**** 9573',
    },
  ];

  void removeMethod(dynamic method) {
    setState(() => methods.remove(method));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigTextHeader(title: "Wallet", action: CloseIconButton()),
              SizedBox(height: 16),
              RoundedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/retip_logo.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "retip credit",
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$4.59",
                        style: TextStyle(
                          color: AppColors.accentDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                color: AppColors.accentLight,
                onPressed: () {},
              ),
              SizedBox(height: 24),
              Text("Payment methods", style: AppTextStyles.sectionHeader),
              SizedBox(height: 16),
              for (var i = 0; i < methods.length; i++) ...[
                PaymentMethodButton(
                  method: methods[i],
                  onRemove: () => removeMethod(methods[i]),
                ),
                SizedBox(height: 16)
              ],
              Spacer(),
              RoundedButton(
                text: "Add a payment method",
                textColor: Colors.white,
                color: AppColors.accent,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
