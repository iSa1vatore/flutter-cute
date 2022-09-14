import 'package:coffee_3in1/features/common/widgets/touch_ripple_effect.dart';
import 'package:coffee_3in1/features/settings/widgets/messages_demo.dart';
import 'package:coffee_3in1/features/settings/widgets/settings_cell.dart';
import 'package:coffee_3in1/features/settings/widgets/settings_params_container.dart';
import 'package:coffee_3in1/features/settings/widgets/settings_slider.dart';
import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'settings_wm.dart';

class SettingsScreen extends CuteWidget<SettingsWM> {
  const SettingsScreen({
    Key? key,
  }) : super(key: key, wmFactory: SettingsWM.factory);

  @override
  Widget build(SettingsWM wm) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CupertinoNavigationBar(
        backgroundColor: wm.appStyle.color.background.withOpacity(.65),
        middle: Text(
          'Settings',
          style: wm.appStyle.appBar.titleTextStyle,
        ),
        border: null,
      ),
      body: ListView(
        children: [
          SettingsParamsContainer(
            title: 'Message',
            cells: [
              MessagesDemo(backgroundImage: wm.chatBackgroundImage),
              SettingsCell(
                title: 'Text size',
                child: SettingsSlider(
                  value: wm.messageTextSize,
                  onChanged: wm.changeMessageTextSize,
                  max: 30,
                  min: 12,
                ),
              ),
              const Divider(),
              SettingsCell(
                title: 'Corners',
                child: SettingsSlider(
                  value: wm.messageCorners,
                  onChanged: wm.changeMessageCorners,
                  max: 17,
                  min: 1,
                ),
              ),
            ],
          ),
          SettingsParamsContainer(
            title: 'Appearance',
            cells: [
              TouchRippleEffect(
                onTap: wm.toggleTheme,
                child: SettingsCell(
                  icon: wm.currentThemeMode == ThemeMode.dark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  child: Text(
                    wm.currentThemeMode == ThemeMode.dark
                        ? "Switch to Day mode"
                        : "Switch to Night mode",
                    style: wm.appStyle.text.buttonSmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
