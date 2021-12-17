import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/registration/verification_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/rounded_button.dart';
import 'package:retip/widgets/rounded_text_field.dart';

class SignInPage extends StatefulWidget {
  final bool isSignUp;

  const SignInPage({Key? key, required this.isSignUp}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void signUp() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => VerificationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Image.asset("assets/retip_logo_white.png"),
              ),
              SizedBox(height: 64),
              if (widget.isSignUp)
                RoundedTextField(
                  hint: "Enter your name",
                  color: AppColors.primaryLight,
                  textColor: AppColors.accent,
                ),
              if (widget.isSignUp) SizedBox(height: 24),
              RoundedTextField(
                hint: "Enter your number",
                color: AppColors.primaryLight,
                textColor: AppColors.accent,
              ),
              SizedBox(height: 24),
              RoundedButton(text: "Next", onPressed: signUp),
              SizedBox(height: 24),
              Text(
                "By tapping Next you are consenting that your phone number be used by Retip to send a verification code.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  height: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
