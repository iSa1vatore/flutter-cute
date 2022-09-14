// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_style.dart';

// **************************************************************************
// CuteThemeGenerator
// **************************************************************************

class AppStyleColor extends ThemeExtension<AppStyleColor> {
  const AppStyleColor({
    required this.primary,
    required this.background,
    required this.appBarBackground,
    required this.card,
    required this.divider,
    required this.icon,
  });

  final Color primary;
  final Color background;
  final Color appBarBackground;
  final Color card;
  final Color divider;
  final Color icon;

  @override
  AppStyleColor copyWith({
    Color? primary,
    Color? background,
    Color? appBarBackground,
    Color? card,
    Color? divider,
    Color? icon,
  }) {
    return AppStyleColor(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      card: card ?? this.card,
      divider: divider ?? this.divider,
      icon: icon ?? this.icon,
    );
  }

  @override
  AppStyleColor lerp(ThemeExtension<AppStyleColor>? other, double t) {
    if (other is! AppStyleColor) return this;

    return AppStyleColor(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      card: Color.lerp(card, other.card, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
    );
  }
}

class AppStyleBorderRadius extends ThemeExtension<AppStyleBorderRadius> {
  const AppStyleBorderRadius({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;

  @override
  AppStyleBorderRadius copyWith({
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
  }) {
    return AppStyleBorderRadius(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppStyleBorderRadius lerp(
      ThemeExtension<AppStyleBorderRadius>? other, double t) {
    if (other is! AppStyleBorderRadius) return this;

    return AppStyleBorderRadius(
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
    );
  }
}

class AppStyleText extends ThemeExtension<AppStyleText> {
  const AppStyleText({
    required this.titleSmall,
    required this.captionMedium,
    required this.buttonSmall,
  });

  final TextStyle titleSmall;
  final TextStyle captionMedium;
  final TextStyle buttonSmall;

  @override
  AppStyleText copyWith({
    TextStyle? titleSmall,
    TextStyle? captionMedium,
    TextStyle? buttonSmall,
  }) {
    return AppStyleText(
      titleSmall: titleSmall ?? this.titleSmall,
      captionMedium: captionMedium ?? this.captionMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
    );
  }

  @override
  AppStyleText lerp(ThemeExtension<AppStyleText>? other, double t) {
    if (other is! AppStyleText) return this;

    return AppStyleText(
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
    );
  }
}

class AppStylePadding extends ThemeExtension<AppStylePadding> {
  const AppStylePadding({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  final EdgeInsets sm;
  final EdgeInsets md;
  final EdgeInsets lg;
  final EdgeInsets xl;

  @override
  AppStylePadding copyWith({
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
  }) {
    return AppStylePadding(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  AppStylePadding lerp(ThemeExtension<AppStylePadding>? other, double t) {
    if (other is! AppStylePadding) return this;

    return AppStylePadding(
      sm: EdgeInsets.lerp(sm, other.sm, t)!,
      md: EdgeInsets.lerp(md, other.md, t)!,
      lg: EdgeInsets.lerp(lg, other.lg, t)!,
      xl: EdgeInsets.lerp(xl, other.xl, t)!,
    );
  }
}

class AppStyleAppBar extends ThemeExtension<AppStyleAppBar> {
  const AppStyleAppBar({
    required this.iconColor,
    required this.titleTextStyle,
  });

  final Color iconColor;
  final TextStyle titleTextStyle;

  @override
  AppStyleAppBar copyWith({
    Color? iconColor,
    TextStyle? titleTextStyle,
  }) {
    return AppStyleAppBar(
      iconColor: iconColor ?? this.iconColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  AppStyleAppBar lerp(ThemeExtension<AppStyleAppBar>? other, double t) {
    if (other is! AppStyleAppBar) return this;

    return AppStyleAppBar(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }
}

class AppStyleMessage extends ThemeExtension<AppStyleMessage> {
  const AppStyleMessage({
    required this.backgroundColor,
    required this.outBackgroundColor,
    required this.textStyle,
    required this.outTextStyle,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final Color outBackgroundColor;
  final TextStyle textStyle;
  final TextStyle outTextStyle;
  final BorderRadius borderRadius;

  @override
  AppStyleMessage copyWith({
    Color? backgroundColor,
    Color? outBackgroundColor,
    TextStyle? textStyle,
    TextStyle? outTextStyle,
    BorderRadius? borderRadius,
  }) {
    return AppStyleMessage(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      outBackgroundColor: outBackgroundColor ?? this.outBackgroundColor,
      textStyle: textStyle ?? this.textStyle,
      outTextStyle: outTextStyle ?? this.outTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  AppStyleMessage lerp(ThemeExtension<AppStyleMessage>? other, double t) {
    if (other is! AppStyleMessage) return this;

    return AppStyleMessage(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      outBackgroundColor:
          Color.lerp(outBackgroundColor, other.outBackgroundColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      outTextStyle: TextStyle.lerp(outTextStyle, other.outTextStyle, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}

class AppStyle extends ThemeExtension<AppStyle> {
  const AppStyle({
    required this.brightness,
    required this.color,
    required this.borderRadius,
    required this.text,
    required this.padding,
    required this.appBar,
    required this.message,
  });

  final Brightness brightness;
  final AppStyleColor color;
  final AppStyleBorderRadius borderRadius;
  final AppStyleText text;
  final AppStylePadding padding;
  final AppStyleAppBar appBar;
  final AppStyleMessage message;

  @override
  AppStyle copyWith({
    Brightness? brightness,
    AppStyleColor? color,
    AppStyleBorderRadius? borderRadius,
    AppStyleText? text,
    AppStylePadding? padding,
    AppStyleAppBar? appBar,
    AppStyleMessage? message,
  }) {
    return AppStyle(
      brightness: brightness ?? this.brightness,
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
      text: text ?? this.text,
      padding: padding ?? this.padding,
      appBar: appBar ?? this.appBar,
      message: message ?? this.message,
    );
  }

  @override
  AppStyle lerp(ThemeExtension<AppStyle>? other, double t) {
    if (other is! AppStyle) return this;

    return AppStyle(
      brightness: brightness,
      color: color.lerp(other.color, t),
      borderRadius: borderRadius.lerp(other.borderRadius, t),
      text: text.lerp(other.text, t),
      padding: padding.lerp(other.padding, t),
      appBar: appBar.lerp(other.appBar, t),
      message: message.lerp(other.message, t),
    );
  }
}

class AppStyleBuilder extends StatelessWidget {
  const AppStyleBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, AppStyle appStyle) builder;

  @override
  Widget build(BuildContext context) =>
      builder(context, Theme.of(context).extension<AppStyle>()!);
}

mixin AppStyleWidgetModelMixin on WidgetModel {
  AppStyle get appStyle => Theme.of(context).extension()!;
}
