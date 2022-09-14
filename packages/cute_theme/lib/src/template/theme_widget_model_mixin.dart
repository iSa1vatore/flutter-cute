//mixin AppThemeWidgetModelMixin on WidgetModel {
//  AppTheme get appTheme => Theme.of(context).extension()!;
//}

import 'package:cute_theme/src/extensions.dart';

class ThemeWidgetModelMixinTemplate {
  ThemeWidgetModelMixinTemplate({required this.className});

  final String className;

  @override
  String toString() {
    return '''
    mixin ${className}WidgetModelMixin on WidgetModel {
      $className get ${className.camelCase} => Theme.of(context).extension()!;
    }
    ''';
  }
}
