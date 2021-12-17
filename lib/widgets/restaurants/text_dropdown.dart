import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDropdown extends StatefulWidget {
  final Function(dynamic)? onChanged;
  final List<String> items;

  const TextDropdown({Key? key, required this.items, this.onChanged}) : super(key: key);

  @override
  State<TextDropdown> createState() => _TextDropdownState();
}

class _TextDropdownState extends State<TextDropdown> {
  late String selected;

  @override
  void initState() {
    selected = widget.items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // isDense: true,
      style: TextStyle(color: Colors.black54),
      value: selected,
      items: [
        for (var item in widget.items)
          DropdownMenuItem(
            value: item,
            child: Text(item),
          ),
      ],
      onChanged: (v) {
        setState(() => selected = (v as String));

        widget.onChanged?.call(v);
      },
    );
  }
}
