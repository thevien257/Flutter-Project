import 'package:flutter/material.dart';
class CustomRadio<T> extends StatefulWidget {
  final T value;                // Giá trị riêng của nút radio này
  final T groupValue;           // Giá trị hiện đang được chọn trong nhóm
  final ValueChanged<T> onChanged; // Callback khi thay đổi
  final String label;           // Nhãn hiển thị
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  State<CustomRadio<T>> createState() => _CustomRadioState<T>();
}
class _CustomRadioState<T> extends State<CustomRadio<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<T>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: (value) {
            if (value != null) {
              widget.onChanged(value);
            }
          },
          activeColor: Colors.teal,
        ),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
