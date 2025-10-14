import 'package:flutter/material.dart';
import '../Widgets/Switch.dart';
import '../Widgets/Checkbox.dart';
import '../Widgets/Radio.dart';
import '../Widgets/Slider.dart';
import '../Widgets/GestureDetector.dart';
import '../Widgets/InkWell.dart';

class Part2Page extends StatefulWidget {
  const Part2Page({super.key});

  @override
  State<Part2Page> createState() => _Part2PageState();
}

class _Part2PageState extends State<Part2Page> {
  bool _switchValue = false;
  bool _checkValue = false;
  double _sliderValue = 0;
  String _radioValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Combined Interactive Controls Card
          _InteractiveControlsCard(
            switchValue: _switchValue,
            checkValue: _checkValue,
            radioValue: _radioValue,
            onSwitchChanged: (value) => setState(() => _switchValue = value),
            onCheckChanged: (value) => setState(() => _checkValue = value),
            onRadioChanged: (value) => setState(() => _radioValue = value),
          ),

          const SizedBox(height: 20),

          // Slider Card
          _SliderCard(
            sliderValue: _sliderValue,
            onSliderChanged: (value) => setState(() => _sliderValue = value),
          ),

          const SizedBox(height: 20),

          // Gesture Detector Card
          const _GestureDetectorCard(),

          const SizedBox(height: 20),

          // InkWell Card
          const _InkWellCard(),
        ],
      ),
    );
  }
}

// Interactive Controls Card Widget
class _InteractiveControlsCard extends StatelessWidget {
  final bool switchValue;
  final bool checkValue;
  final String radioValue;
  final ValueChanged<bool> onSwitchChanged;
  final ValueChanged<bool> onCheckChanged;
  final ValueChanged<String> onRadioChanged;

  const _InteractiveControlsCard({
    required this.switchValue,
    required this.checkValue,
    required this.radioValue,
    required this.onSwitchChanged,
    required this.onCheckChanged,
    required this.onRadioChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Controls',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 16),

            // Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Custom Switch',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                CustomSwitch(
                  initialValue: switchValue,
                  onChanged: onSwitchChanged,
                ),
              ],
            ),

            const SizedBox(height: 1),

            // Checkbox
            Row(
              children: [
                const Text(
                  'Custom Checkbox:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 60),
                CustomCheckbox(
                  initialValue: checkValue,
                  onChanged: onCheckChanged,
                ),
                const Text("Tôi đồng ý", style: TextStyle(fontSize: 16)),
              ],
            ),

            const SizedBox(height: 10),

            // Radio
            const Text(
              'Custom Radio',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            CustomRadio<String>(
              value: 'Option 1',
              groupValue: radioValue,
              label: 'Option 1',
              onChanged: onRadioChanged,
            ),
            CustomRadio<String>(
              value: 'Option 2',
              groupValue: radioValue,
              label: 'Option 2',
              onChanged: onRadioChanged,
            ),
          ],
        ),
      ),
    );
  }
}

// Slider Card Widget
class _SliderCard extends StatelessWidget {
  final double sliderValue;
  final ValueChanged<double> onSliderChanged;

  const _SliderCard({required this.sliderValue, required this.onSliderChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.5),
        child: Column(
          children: [
            const Text(
              'Custom Slider',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            CustomSlider(initialValue: sliderValue, onChanged: onSliderChanged),
          ],
        ),
      ),
    );
  }
}

// Gesture Detector Card Widget
class _GestureDetectorCard extends StatefulWidget {
  const _GestureDetectorCard();

  @override
  State<_GestureDetectorCard> createState() => _GestureDetectorCardState();
}

class _GestureDetectorCardState extends State<_GestureDetectorCard> {
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Custom GestureDetector',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CustomGestureDetector(
              text: 'Nhấn vào đây',
              onTap: () => setState(() => _status = 'Tap'),
              onDoubleTap: () => setState(() => _status = 'Double Tap'),
              onLongPress: () => setState(() => _status = 'Long Press'),
            ),
            if (_status.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Action: $_status',
                  style: const TextStyle(fontSize: 14, color: Colors.teal),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// InkWell Card Widget
class _InkWellCard extends StatefulWidget {
  const _InkWellCard();

  @override
  State<_InkWellCard> createState() => _InkWellCardState();
}

class _InkWellCardState extends State<_InkWellCard> {
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Custom InkWell',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CustomInkWell(
              label: 'Nhấn vào đây',
              onTap: () => setState(() => _status = 'Tap'),
              onDoubleTap: () => setState(() => _status = 'Double Tap'),
              onLongPress: () => setState(() => _status = 'Long Press'),
            ),
            if (_status.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Action: $_status',
                  style: const TextStyle(fontSize: 14, color: Colors.teal),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
