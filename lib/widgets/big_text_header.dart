import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class BigTextHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? action;

  const BigTextHeader({Key? key, required this.title, this.subtitle, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.accentDark,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                if (action != null) action!,
              ],
            ),
            if (subtitle != null) SizedBox(height: 8),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(
                  color: AppColors.subtitleText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )
          ],
        ),
      ),
    );
  }
}
