import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:flutter/material.dart';

class SettingsSlider extends StatelessWidget {
  const SettingsSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.max,
    required this.min,
  }) : super(key: key);

  final double value;
  final ValueChanged<double> onChanged;

  final double max;
  final double min;

  @override
  Widget build(BuildContext context) {
    return AppStyleBuilder(
      builder: (context, style) => Row(
        children: [
          Expanded(
            child: Slider(
              max: max,
              min: min,
              onChanged: onChanged,
              value: value,
            ),
          ),
          Padding(
            padding: style.padding.md.copyWith(right: 0),
            child: SizedBox(
              width: 24,
              child: Text(
                value.toStringAsFixed(0),
                textAlign: TextAlign.right,
                style: style.text.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
