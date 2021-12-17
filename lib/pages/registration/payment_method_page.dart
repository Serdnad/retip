import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigTextHeader(
                title: "Enter method",
                subtitle: "Method of payment for tipping",
                action: CloseIconButton(),
              ),
              SizedBox(height: 24),
              RoundedButton(
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                text: "Credit or debit card",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("This will open a new page to enter your info with Stripe or Plaid")),
                  );
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/paypal.png",
                      height: 20,
                    ),
                  ],
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("This will open a new page to enter your info with Stripe or Plaid")),
                  );
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                color: AppColors.accentLight,
                textColor: AppColors.accentDark,
                text: "Credit or debit card",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("This will open a new page to enter your info with Stripe or Plaid")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
