import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/material.dart';

class AppWM extends WidgetModel {
  AppWM.factory(_);

  var themeMode = ThemeMode.dark;

  double messageBorderRadius = 16;
  double messageTextSize = 16;

  void changeMessageTextSize(double value) =>
      setState(() => messageTextSize = value);

  void changeMessageBorderRadius(double value) =>
      setState(() => messageBorderRadius = value);

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setState();
  }
}
