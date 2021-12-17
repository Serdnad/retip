import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/rounded_button.dart';

class PaymentMethodButton extends StatelessWidget {
  final Map method; // TODO: make type, persistence manager, etc.
  final VoidCallback onRemove;

  const PaymentMethodButton({Key? key, required this.onRemove, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      color: AppColors.accentLight,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Row(
          children: [
            Image.asset("assets/visa.png", height: 20),
            SizedBox(width: 8),
            Text(
              method["number"],
              style: TextStyle(
                color: AppColors.accentDark,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.close, color: AppColors.accentDark, size: 28),
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
