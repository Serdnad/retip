import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color color;
  final Color? textColor;

  const RoundedButton({Key? key, this.onPressed, this.text, this.color = Colors.white, this.textColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(text != null || child != null, "Either text or child must be provided");

    return MaterialButton(
      child: text != null
          ? Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          : child,
      color: color,
      padding: EdgeInsets.symmetric(vertical: 16),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      elevation: 0,
    );
  }
}
