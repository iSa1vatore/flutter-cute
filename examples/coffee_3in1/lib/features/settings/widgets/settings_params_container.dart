import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:flutter/material.dart';

class SettingsParamsContainer extends StatelessWidget {
  const SettingsParamsContainer({
    Key? key,
    required this.cells,
    required this.title,
  }) : super(key: key);

  final List<Widget> cells;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppStyleBuilder(builder: (context, style) {
      return Padding(
        padding: style.padding.md.add(
          style.padding.md.copyWith(
            top: 0,
            bottom: 0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: style.padding.md,
              child: Text(title.toUpperCase(), style: style.text.captionMedium),
            ),
            ClipRRect(
              borderRadius: style.borderRadius.lg,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: style.color.card,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cells,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
