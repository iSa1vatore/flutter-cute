//extension BuildContextExt on BuildContext {
//  AppTheme get appTheme => Theme.of(this).extension();
//}

import 'package:cute_theme/src/extensions.dart';

class ThemeContextExtensionTemplate {
  ThemeContextExtensionTemplate({required this.className});

  final String className;

  @override
  String toString() {
    return '''
    extension ${className}BuildContextExt on BuildContext {
      $className get ${className.camelCase} => Theme.of(this).extension();
    }
    ''';
  }
}
