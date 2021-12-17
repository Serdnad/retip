import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/registration/sign_in_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/rounded_button.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void signUp() => Navigator.push(context, CupertinoPageRoute(builder: (_) => SignInPage(isSignUp: true)));

  void signIn() => Navigator.push(context, CupertinoPageRoute(builder: (_) => SignInPage(isSignUp: false)));

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
              RoundedButton(
                text: "Sign up",
                color: Colors.white,
                textColor: AppColors.accent,
                onPressed: signUp,
              ),
              SizedBox(height: 24),
              RoundedButton(
                text: "Sign in",
                color: AppColors.primaryLight,
                textColor: AppColors.accent,
                onPressed: signIn,
              ),
              SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    height: 2,
                  ),
                  children: [
                    TextSpan(text: "By tapping Sign up or Sign in you are agreeing to our "),
                    TextSpan(text: "Terms", style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: ". For more information on how we manage your data, check out our "),
                    TextSpan(text: "Privacy Policy", style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: "."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
