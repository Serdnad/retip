import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:retip/utils/app_colors.dart';

class CodeEntry extends StatelessWidget {
  final Function(String)? onChanged;

  const CodeEntry({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        onChanged: onChanged ?? (_) {},
        pinTheme: PinTheme(
          borderWidth: 4,
          selectedColor: Colors.white,
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
      ),
    );
  }
}
