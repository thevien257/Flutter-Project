import 'package:flutter/material.dart';
class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  const CustomCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}
class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;
  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(_isChecked);
      },
      activeColor: Colors.green,
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.grey, width: 2),
    );
  }
}
