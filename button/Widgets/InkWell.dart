import 'package:flutter/material.dart';

class CustomInkWell extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  const CustomInkWell({
    super.key,
    required this.label,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  String _status = "Chưa thao tác";

  void _handleTap() {
    setState(() => _status = "Bạn đã chạm 1 lần!");
    widget.onTap?.call();
  }

  void _handleDoubleTap() {
    setState(() => _status = "Bạn đã chạm đúp!");
    widget.onDoubleTap?.call();
  }

  void _handleLongPress() {
    setState(() => _status = "Bạn đã giữ lâu!");
    widget.onLongPress?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Bắt buộc để hiệu ứng ripple hiển thị
      child: InkWell(
        onTap: _handleTap,
        onDoubleTap: _handleDoubleTap,
        onLongPress: _handleLongPress,
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.tealAccent.shade200, // tăng độ nổi bật
        highlightColor: Colors.teal.withOpacity(0.3), // highlight rõ hơn
        splashFactory: InkRipple.splashFactory, // ripple chuẩn, rõ nét
        child: Ink(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _status,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
