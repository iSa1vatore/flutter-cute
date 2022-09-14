import 'package:coffee_3in1/assets/style/styles/app_styles.dart';
import 'package:coffee_3in1/features/app/app_wm.dart';
import 'package:coffee_3in1/features/settings/screens/settings_screen/settings_screen.dart';
import 'package:cute_di_scope/cute_di_scope.dart';
import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/material.dart';

class App extends CuteWidget<AppWM> {
  const App({
    Key? key,
  }) : super(key: key, wmFactory: AppWM.factory);

  @override
  Widget build(AppWM wm) {
    return MaterialApp(
      title: 'Flutter-cute',
      debugShowCheckedModeBanner: false,
      theme: AppStyles.light
          .copyWith(
            message: AppStyles.light.message.copyWith(
              borderRadius: BorderRadius.circular(wm.messageBorderRadius),
              outTextStyle: AppStyles.light.message.outTextStyle.copyWith(
                fontSize: wm.messageTextSize,
              ),
              textStyle: AppStyles.light.message.textStyle.copyWith(
                fontSize: wm.messageTextSize,
              ),
            ),
          )
          .toMaterialTheme(),
      darkTheme: AppStyles.dark
          .copyWith(
            message: AppStyles.dark.message.copyWith(
              borderRadius: BorderRadius.circular(wm.messageBorderRadius),
              outTextStyle: AppStyles.dark.message.outTextStyle.copyWith(
                fontSize: wm.messageTextSize,
              ),
              textStyle: AppStyles.dark.message.textStyle.copyWith(
                fontSize: wm.messageTextSize,
              ),
            ),
          )
          .toMaterialTheme(),
      themeMode: wm.themeMode,
      home: CuteDiScope<AppWM>(
        factory: (_) => wm,
        child: const SettingsScreen(),
      ),
    );
  }
}
