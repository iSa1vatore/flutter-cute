import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:flutter/material.dart';

class MessagesDemo extends StatelessWidget {
  const MessagesDemo({Key? key, required this.backgroundImage})
      : super(key: key);

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return AppStyleBuilder(builder: (context, theme) {
      return Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                key: ValueKey<String>(backgroundImage),
                backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: theme.padding.md,
            child: Column(
              children: const [
                MessageBubble(text: 'I know where u live!', isOut: false),
                MessageBubble(text: 'Really?!', isOut: true),
                MessageBubble(text: 'No.', isOut: false),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.text, required this.isOut})
      : super(key: key);

  final String text;
  final bool isOut;

  @override
  Widget build(BuildContext context) {
    return AppStyleBuilder(
      builder: (context, style) => Padding(
        padding: style.padding.sm,
        child: Align(
          alignment: isOut ? Alignment.centerRight : Alignment.centerLeft,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: style.message.borderRadius,
              color: isOut
                  ? style.message.outBackgroundColor
                  : style.message.backgroundColor,
            ),
            child: Padding(
              padding: style.padding.md.add(
                const EdgeInsets.symmetric(horizontal: 4),
              ),
              child: Text(
                text,
                style: isOut
                    ? style.message.outTextStyle
                    : style.message.textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
