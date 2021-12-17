import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/pages/tips/new_tip_page.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/code_entry.dart';
import 'package:retip/widgets/header/close_icon_button.dart';
import 'package:retip/widgets/rounded_button.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({Key? key}) : super(key: key);

  @override
  _EnterCodePageState createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  String code = '';

  void updateCode(String c) {
    setState(() => code = c);
  }

  void resendCode() {}

  void loadCode() {
    // TODO: load lol

    Navigator.push(context, CupertinoPageRoute(builder: (_) => NewTipPage()));
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
                title: "Enter number",
                subtitle: "6-digit number under QR code",
                action: CloseIconButton(),
              ),
              SizedBox(height: 24),
              CodeEntry(onChanged: updateCode),
              Spacer(),
              RoundedButton(
                text: "Next",
                onPressed: loadCode,
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
