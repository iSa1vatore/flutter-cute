import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:flutter/material.dart';

class SettingsCell extends StatelessWidget {
  const SettingsCell({
    Key? key,
    this.title,
    this.icon,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppStyleBuilder(
      builder: (context, style) => ColoredBox(
        color: style.color.card,
        child: Padding(
          padding: style.padding.lg,
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: style.padding.lg.copyWith(
                    left: 0,
                    top: 0,
                    bottom: 0,
                  ),
                  child: Icon(icon, color: style.color.primary),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(title!, style: style.text.titleSmall),
                    child,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
