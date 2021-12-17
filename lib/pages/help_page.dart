import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BigTextHeader(title: "Help", action: CloseIconButton()),
                SizedBox(height: 16),
                RoundedButton(
                  text: "Information",
                  color: AppColors.accentLight,
                  textColor: AppColors.accentDark,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                RoundedButton(
                  text: "Issues",
                  color: AppColors.accentLight,
                  textColor: AppColors.accentDark,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                RoundedButton(
                  text: "More",
                  color: AppColors.accentLight,
                  textColor: AppColors.accentDark,
                  onPressed: () {},
                ),
                SizedBox(height: 16),
                Container(height: 1, color: AppColors.accentLight),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(color: Colors.white),
                  maxLines: 6,
                  cursorColor: Colors.white,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Type in support email...",
                    filled: true,
                    fillColor: AppColors.accentLight,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.accentLight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RoundedButton(
                  text: "Send",
                  color: AppColors.accent,
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Support email sent successfully!")),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
