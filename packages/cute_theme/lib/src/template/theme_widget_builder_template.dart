//class AppThemeBuilder extends StatelessWidget {
//  const AppThemeBuilder({super.key, required this.builder});
//
//  final Widget Function(BuildContext context, AppTheme appTheme) builder;
//
//  @override
//  Widget build(BuildContext context) =>
//      builder(context, Theme.of(context).extension<AppTheme>()!);
//}

import 'package:cute_theme/src/extensions.dart';

class ThemeWidgetBuilderTemplate {
  ThemeWidgetBuilderTemplate({required this.className});

  final String className;

  @override
  String toString() {
    return '''
    class ${className}Builder extends StatelessWidget {
      const ${className}Builder({super.key, required this.builder});
      
      final Widget Function(BuildContext context, $className ${className.camelCase}) builder;
      
      @override
      Widget build(BuildContext context) =>
          builder(context, Theme.of(context).extension<$className>()!);
    }
    ''';
  }
}
