import 'package:cute_theme_annotation/cute_theme_annotation.dart';
import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/material.dart';

part 'app_style.cute.dart';

@CuteTheme(options: [
  CuteThemeOptions.genThemeWidgetBuilder,
  CuteThemeOptions.genMixinForWM,
])
class $AppStyle {
  $AppStyle({
    required Brightness brightness,
  });

  $AppStyle.color({
    required Color primary,
    required Color background,
    required Color appBarBackground,
    required Color card,
    required Color divider,
    required Color icon,
  });

  $AppStyle.borderRadius({
    required BorderRadius sm,
    required BorderRadius md,
    required BorderRadius lg,
    required BorderRadius xl,
  });

  $AppStyle.text({
    required TextStyle titleSmall,
    required TextStyle captionMedium,
    required TextStyle buttonSmall,
  });

  $AppStyle.padding({
    required EdgeInsets sm,
    required EdgeInsets md,
    required EdgeInsets lg,
    required EdgeInsets xl,
  });

  $AppStyle.appBar({
    required Color iconColor,
    required TextStyle titleTextStyle,
  });

  $AppStyle.message({
    required Color backgroundColor,
    required Color outBackgroundColor,
    required TextStyle textStyle,
    required TextStyle outTextStyle,
    required BorderRadius borderRadius,
  });
}
