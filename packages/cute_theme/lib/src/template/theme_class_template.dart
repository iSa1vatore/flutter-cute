import 'package:analyzer/dart/element/element.dart';

import '../models/constructor_param.dart';

class ThemeClassTemplate {
  ThemeClassTemplate({
    required this.className,
    required this.constructorParameters,
    required this.fields,
  });

  final List<ConstructorParam> constructorParameters;
  final List<FieldElement> fields;
  final String className;

  String _constructorAndFields() {
    final constructorBuffer = StringBuffer();
    final fieldsBuffer = StringBuffer();

    for (var parameter in constructorParameters) {
      constructorBuffer.write('required this.${parameter.name},');
      fieldsBuffer.write('final ${parameter.type} ${parameter.name};');
    }

    for (var element in fields) {
      fieldsBuffer.write('final ${element.type} ${element.name};');
    }

    return '''
      const $className({
        ${constructorBuffer.toString()}
      });
    
      ${fieldsBuffer.toString()}
    ''';
  }

  String _copyWithMethod() {
    final methodParams = StringBuffer();
    final classParams = StringBuffer();

    for (var parameter in constructorParameters) {
      methodParams.write('${parameter.type}? ${parameter.name},');
      classParams.write(
        '${parameter.name}: ${parameter.name} ?? this.${parameter.name},',
      );
    }

    return '''
    @override
    $className copyWith({
      ${methodParams.toString()}
    }) {
      return $className(
        ${classParams.toString()}
      );
    }
    ''';
  }

  String _lerpMethod() {
    final classParams = StringBuffer();

    for (var parameter in constructorParameters) {
      var paramName = parameter.name;
      var paramType = parameter.type;

      if (paramType.contains(className)) {
        classParams.write(
          "$paramName: $paramName.lerp(other.$paramName, t),",
        );
      } else if (paramType == "Brightness") {
        classParams.write("$paramName: $paramName,");
      } else {
        classParams.write(
          "$paramName: $paramType.lerp($paramName, other.$paramName, t)!,",
        );
      }
    }

    return '''
    @override
    $className lerp(ThemeExtension<$className>? other, double t) {
      if (other is! $className) return this;
      
      return $className(
        ${classParams.toString()}
      );
    }
    ''';
  }

  @override
  String toString() {
    return '''
    class $className extends ThemeExtension<$className> {
      ${_constructorAndFields()}
      ${_copyWithMethod()}
      ${_lerpMethod()}
    }
    ''';
  }
}
