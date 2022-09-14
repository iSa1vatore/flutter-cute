import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:cute_theme/src/extensions.dart';
import 'package:cute_theme/src/template/theme_class_template.dart';
import 'package:cute_theme/src/template/theme_context_extension_template.dart';
import 'package:cute_theme/src/template/theme_widget_builder_template.dart';
import 'package:cute_theme/src/template/theme_widget_model_mixin.dart';
import 'package:cute_theme_annotation/cute_theme_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'models/constructor_param.dart';

class CuteThemeGenerator extends GeneratorForAnnotation<CuteTheme> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      _generateSource(element, annotation);

  String _generateSource(Element element, ConstantReader annotation) {
    var options = annotation.read('options').listValue;
    var visitor = ModelVisitor();
    element.visitChildren(visitor);

    var className = visitor.className.toString().substring(1);

    final generatorBuffer = StringBuffer();

    var nestedStyles = visitor.constructors.keys.where(
      (name) => name != "__",
    );

    for (var constructorName in nestedStyles) {
      var constructorParams = visitor.constructors[constructorName];

      generatorBuffer.write(ThemeClassTemplate(
        className: className + constructorName.capitalize,
        constructorParameters: constructorParams ?? [],
        fields: [],
      ));
    }

    generatorBuffer.write(ThemeClassTemplate(
      className: className,
      constructorParameters: [
        ...visitor.constructors["__"] ?? [],
        for (var constructorName in nestedStyles)
          ConstructorParam(
            name: constructorName,
            type: "$className${constructorName.capitalize}",
          )
      ],
      fields: [],
    ));

    for (var optionDetails in options) {
      var option = CuteThemeOptions
          .values[optionDetails.getField("index")!.toIntValue()!];

      switch (option) {
        case CuteThemeOptions.genMixinForWM:
          generatorBuffer.write(ThemeWidgetModelMixinTemplate(
            className: className,
          ));
          break;
        case CuteThemeOptions.genBuildContextExtension:
          generatorBuffer.write(ThemeContextExtensionTemplate(
            className: className,
          ));
          break;
        case CuteThemeOptions.genThemeWidgetBuilder:
          generatorBuffer.write(ThemeWidgetBuilderTemplate(
            className: className,
          ));
          break;
      }
    }

    return generatorBuffer.toString();
  }
}

class ModelVisitor extends SimpleElementVisitor {
  late DartType className;
  List<FieldElement> fields = [];

  Map<String, List<ConstructorParam>> constructors = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType;

    for (var parameter in element.parameters) {
      String constructorName = element.name == "" ? "__" : element.name;

      if (constructors[constructorName] == null) {
        constructors[constructorName] = [];
      }

      constructors[constructorName]!.add(ConstructorParam(
        name: parameter.name,
        type: parameter.type.toString(),
      ));
    }
  }

  // @override
  // void visitFieldElement(FieldElement element) {
  //   fields.add(element);
  // }
}
