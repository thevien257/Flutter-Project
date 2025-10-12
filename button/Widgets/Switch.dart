import 'package:flutter/material.dart';
class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}
class _CustomSwitchState extends State<CustomSwitch> {
  late bool _isOn;
  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isOn,
      onChanged: (value) {
        setState(() {
          _isOn = value;
        });
        widget.onChanged(value);
      },
      activeColor: Colors.green,
      inactiveThumbColor: Colors.grey,
    );
  }
}
