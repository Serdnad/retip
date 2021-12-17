import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class RoundedTextField extends StatelessWidget {
  final String? hint;
  final Color color;
  final Color? textColor;
  final TextEditingController? controller;

  const RoundedTextField({Key? key, this.hint, this.controller, this.color = AppColors.accent, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: color,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: TextStyle(
        color: textColor ?? AppColors.accentDark,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
