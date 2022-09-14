extension StringCamelCase on String {
  String get camelCase => "${this[0].toLowerCase()}${substring(1)}";
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
}
