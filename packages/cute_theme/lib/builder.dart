import 'package:build/build.dart';
import 'package:cute_theme/src/cute_theme_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder cuteThemeBuilder(BuilderOptions options) {
  return PartBuilder(
    [CuteThemeGenerator()],
    '.cute.dart',
    header: '''
    // coverage:ignore-file
    // GENERATED CODE - DO NOT MODIFY BY HAND
    // ignore_for_file: type=lint, unused_element
    ''',
    options: options,
  );
}
