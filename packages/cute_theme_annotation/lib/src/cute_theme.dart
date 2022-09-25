enum CuteThemeOptions {
  /// ### Generates a mixin for the [WidgetModel].
  ///
  /// ```dart
  /// class SomeWM extends WidgetModel with AppThemeWidgetModelMixin {
  ///   ...
  /// }
  ///
  /// @override
  /// Widget build(SomeWM wm) {
  ///   return Scaffold(
  ///     appBar: AppBar(title: const Text('Cute Theme demo')),
  ///     body: Padding(
  ///       padding: wm.appTheme.paddingX1,
  ///       child: Text('CuteTheme', style: wm.appTheme.textH1),
  ///     ),
  ///   );
  /// }
  /// ```
  genMixinForWM,

  /// ### Generates an extension for the [BuildContext].
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Text('CuteTheme', style: context.appTheme.textH1);
  /// }
  /// ```
  genBuildContextExtension,

  /// ### Generates a widget builder with a theme.
  ///
  /// ```dart
  /// AppThemeBuilder(
  ///   builder: (context, theme) => Padding(
  ///     padding: theme.paddingX1,
  ///     child: Text('CuteTheme', style: theme.textH1),
  ///   ),
  /// )
  /// ```
  genThemeWidgetBuilder,
}

class CuteTheme {
  const CuteTheme({this.options = const []});

  final List<CuteThemeOptions> options;
}
