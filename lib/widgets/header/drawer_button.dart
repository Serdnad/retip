import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class DrawerButton extends StatelessWidget {
  void openDrawer() {}

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: AppColors.accentDark, size: 32),
      onPressed: () => Scaffold.of(context).openEndDrawer(),
      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
      constraints: BoxConstraints(),
    );
  }
}
