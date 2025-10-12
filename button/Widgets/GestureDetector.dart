import 'package:flutter/material.dart';

class CustomGestureDetector extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  const CustomGestureDetector({
    super.key,
    required this.text,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  Color _color = Colors.teal.shade100;
  String _status = 'Chưa thao tác';

  void _resetStatus() {
    if (!mounted) return;
    setState(() {
      _color = Colors.teal.shade100;
      _status = 'Chưa thao tác';
    });
  }

  void _handleTap() {
    setState(() {
      _color = Colors.teal.shade300;
      _status = 'Đã nhấn một lần';
    });
    widget.onTap?.call();

    Future.delayed(const Duration(milliseconds: 500), _resetStatus);
  }

  void _handleDoubleTap() {
    setState(() {
      _color = Colors.blueAccent.shade100;
      _status = 'Nhấn đúp';
    });
    widget.onDoubleTap?.call();

    Future.delayed(const Duration(milliseconds: 500), _resetStatus);
  }

  void _handleLongPress() {
    setState(() {
      _color = Colors.orangeAccent.shade100;
      _status = 'Giữ lâu';
    });
    widget.onLongPress?.call();
    // Không reset ở đây, chờ thả tay
  }

  void _handleLongPressUp() {
    _resetStatus(); // reset khi người dùng thả tay
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onDoubleTap: _handleDoubleTap,
      onLongPress: _handleLongPress,
      onLongPressUp: _handleLongPressUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _status,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
