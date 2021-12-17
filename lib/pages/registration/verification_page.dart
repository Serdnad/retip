import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/registration/payment_method_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/code_entry.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String code = '';

  void updateCode(String c) {
    setState(() => code = c);
  }

  void resendCode() {}

  void verifyCode() {
    // TODO: verify lol

    Navigator.push(context, CupertinoPageRoute(builder: (_) => PaymentMethodPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigTextHeader(
                title: "Enter code",
                subtitle: "Verification code sent to your phone",
                action: CloseIconButton(),
              ),
              SizedBox(height: 24),
              CodeEntry(onChanged: updateCode),
              SizedBox(height: 24),
              RoundedButton(
                text: "Resend code",
                onPressed: resendCode,
                color: AppColors.accent,
                textColor: Colors.white,
              ),
              Spacer(),
              RoundedButton(
                text: "Next",
                onPressed: verifyCode,
                color: code.length < 6 ? AppColors.accentLight : AppColors.accent,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
