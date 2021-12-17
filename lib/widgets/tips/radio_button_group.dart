import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/utils/app_colors.dart';
import 'package:retip/widgets/rounded_button.dart';

class RadioButtonGroup extends StatefulWidget {
  final List<String> items;
  final Function(String) onSelected;

  const RadioButtonGroup({Key? key, required this.items, required this.onSelected}) : super(key: key);

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  int? selectedIndex;

  void select(int index) {
    setState(() => selectedIndex = index);

    widget.onSelected(widget.items[selectedIndex!]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < widget.items.length; i++) ...[
          Expanded(
            child: RoundedButton(
              text: widget.items[i],
              textColor: Colors.white,
              color: i == selectedIndex ? AppColors.accent : AppColors.accentLight,
              onPressed: () => select(i),
            ),
          ),
          if (i < widget.items.length - 1) SizedBox(width: 16),
        ],
      ],
    );
  }
}
