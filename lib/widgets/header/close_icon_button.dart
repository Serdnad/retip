import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  final Color color;

  const CloseIconButton({Key? key, this.color = AppColors.accentDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close, color: color, size: 36),
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 4),
      constraints: BoxConstraints(),
    );
  }
}
