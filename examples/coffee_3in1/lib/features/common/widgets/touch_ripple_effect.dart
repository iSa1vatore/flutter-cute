import 'package:flutter/material.dart';

class TouchRippleEffect extends StatelessWidget {
  const TouchRippleEffect({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius = 0,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
