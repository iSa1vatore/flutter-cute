import 'package:coffee_3in1/assets/style/app_style.dart';
import 'package:coffee_3in1/assets/style/styles/slider_style.dart';
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static const AppStylePadding _padding = AppStylePadding(
    sm: EdgeInsets.all(4),
    md: EdgeInsets.all(8),
    lg: EdgeInsets.all(16),
    xl: EdgeInsets.all(32),
  );

  static final AppStyleBorderRadius _borderRadius = AppStyleBorderRadius(
    sm: BorderRadius.circular(4),
    md: BorderRadius.circular(8),
    lg: BorderRadius.circular(16),
    xl: BorderRadius.circular(32),
  );

  static const AppStyleText _text = AppStyleText(
    titleSmall: TextStyle(fontWeight: FontWeight.w500),
    captionMedium: TextStyle(fontSize: 15.0, color: Color(0xFF8d8d8e)),
    buttonSmall: TextStyle(fontSize: 16),
  );

  static AppStyle get light {
    return AppStyle(
      brightness: Brightness.light,
      color: const AppStyleColor(
        primary: Color(0xFF3bc4b6),
        background: Color(0xFFf0f0f0),
        appBarBackground: Color(0xFF408b85),
        card: Color(0xFFffffff),
        divider: Color(0xFFd9d9d9),
        icon: Color(0xFF000000),
      ),
      message: AppStyleMessage(
        backgroundColor: const Color(0xFFFFFFFF),
        outBackgroundColor: const Color(0xFFdcf8e5),
        textStyle: const TextStyle(fontSize: 16),
        outTextStyle: const TextStyle(fontSize: 16),
        borderRadius: BorderRadius.circular(16),
      ),
      appBar: const AppStyleAppBar(
        iconColor: Color(0xFFFFFFFF),
        titleTextStyle: TextStyle(
          color: Color(0xFF000000),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      padding: _padding,
      borderRadius: _borderRadius,
      text: _text.copyWith(
        titleSmall: _text.titleSmall.copyWith(color: const Color(0xFF10b096)),
        buttonSmall: _text.buttonSmall.copyWith(color: const Color(0xFF10b096)),
      ),
    );
  }

  static AppStyle get dark {
    return AppStyle(
      brightness: Brightness.dark,
      color: const AppStyleColor(
        primary: Color(0xFF8cd2dc),
        background: Color(0xFF000000),
        appBarBackground: Color(0xFF242426),
        card: Color(0xFF181819),
        divider: Color(0xFF000000),
        icon: Color(0xFFFFFFFF),
      ),
      message: AppStyleMessage(
        backgroundColor: const Color(0xFF202222),
        outBackgroundColor: const Color(0xFF457e86),
        textStyle: const TextStyle(fontSize: 16),
        outTextStyle: const TextStyle(fontSize: 16),
        borderRadius: BorderRadius.circular(16),
      ),
      appBar: const AppStyleAppBar(
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        iconColor: Color(0xFFFFFFFF),
      ),
      padding: _padding,
      borderRadius: _borderRadius,
      text: _text.copyWith(
        titleSmall: _text.titleSmall.copyWith(color: const Color(0xFF8cd2dc)),
        buttonSmall: _text.buttonSmall.copyWith(color: const Color(0xFF8cd2dc)),
      ),
    );
  }
}

extension AppThemeToMaterialTheme on AppStyle {
  toMaterialTheme() {
    final ThemeData theme = ThemeData(
      brightness: brightness,
      extensions: [this],
    );

    return theme.copyWith(
      scaffoldBackgroundColor: color.background,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: color.appBarBackground,
        iconTheme: IconThemeData(color: appBar.iconColor),
        titleTextStyle: appBar.titleTextStyle,
      ),
      colorScheme: theme.colorScheme.copyWith(
        primary: color.primary,
        secondary: color.primary,
      ),
      sliderTheme: SliderThemeData(
        trackShape: SliderShapeStyle(),
        trackHeight: 2.5,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 8.0,
          elevation: 0,
          pressedElevation: 0,
        ),
      ),
      iconTheme: IconThemeData(color: color.icon),
      dividerTheme: DividerThemeData(color: color.divider, space: 1),
    );
  }
}

extension ColorToMaterialColor on Color {
  toMaterialColor() {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};

    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }
}
