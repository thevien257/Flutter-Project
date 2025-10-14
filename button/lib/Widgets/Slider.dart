import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double initialValue;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          value: _currentValue,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          activeColor: Colors.teal,
          label: _currentValue.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
            widget.onChanged(value);
          },
        ),
        Text(
          'Giá trị: ${_currentValue.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
