import 'package:coffee_3in1/assets/res/images.dart';
import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:coffee_3in1/features/app/app_wm.dart';
import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsWM extends WidgetModel with AppStyleWidgetModelMixin {
  SettingsWM.factory(BuildContext context) : _appWM = context.read();

  final AppWM _appWM;

  double get messageTextSize => _appWM.messageTextSize;
  double get messageCorners => _appWM.messageBorderRadius;

  void changeMessageTextSize(double value) =>
      _appWM.changeMessageTextSize(value.roundToDouble());

  void changeMessageCorners(double value) =>
      _appWM.changeMessageBorderRadius(value.roundToDouble());

  void toggleTheme() => _appWM.toggleTheme();

  String get chatBackgroundImage => appStyle.brightness == Brightness.dark
      ? ImagesPath.backgroundDark
      : ImagesPath.backgroundLight;

  ThemeMode get currentThemeMode => _appWM.themeMode;
}
