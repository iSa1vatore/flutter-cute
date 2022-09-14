import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A widget that use WidgetModel for build.
///
/// ```dart
/// class SomeDetailsPage extends CuteWidget<SomeDetailsWM> {
///   const SomeDetailsPage({
///     required this.someId,
///     Key? key,
///   }) : super(key: key, wmFactory: SomeDetailsWM.factory);
///
///   final int someId;
///
///   @override
///   Widget build(SomeDetailsWM wm) {
///     return Scaffold(
///       appBar: AppBar(title: Text(wm.pageTitle)),
///       body: Padding(
///         padding: const EdgeInsets.all(20),
///         child: Center(
///           child: Text(
///             wm.name ?? "Loading...",
///             style: wm.textTheme.headlineSmall,
///           ),
///         ),
///       ),
///     );
///   }
/// }
///
/// class SomeDetailsWM extends WidgetModel<SomeDetailsPage> {
///   SomeDetailsWM.factory(BuildContext context);
///
///   TextTheme get textTheme => Theme.of(context).textTheme;
///
///   String get pageTitle => "Flutter cute demo";
///   String? name;
///
///   @override
///   void init() {
///     var names = ['John', 'Ivan', 'Maria', 'Rejoice', 'Elena'];
///
///     setState(() {
///       try {
///         name = names.elementAt(widget.someId);
///       } on RangeError {
///         name = "None";
///       }
///     });
///   }
/// }
/// ```
abstract class CuteWidget<I> extends Widget {
  const CuteWidget({
    required this.wmFactory,
    Key? key,
  }) : super(key: key);

  /// Factory for creating widget model.
  final WidgetModel Function(BuildContext) wmFactory;

  /// Creates a [CuteElement] to manage this widget's location in the tree.
  ///
  /// It is uncommon for subclasses to override this method.
  @override
  Element createElement() => CuteElement(this);

  /// Describes the part of the user interface represented by this widget.
  ///
  /// Provides access to the [WidgetModel]
  /// which contains all of the widget presentation logic.
  ///
  /// Access to the [BuildContext] also occurs through the [WidgetModel].
  Widget build(I wm);
}

/// Contains all presentation logic of the widget.
abstract class WidgetModel<W extends CuteWidget> with Diagnosticable {
  /// Notify the widget that the internal state of widget model has changed.
  ///
  /// ```dart
  /// setState(() { _value = newValue; });
  /// ```
  ///
  /// ```dart
  /// _value = newValue;
  /// setState();
  /// ```
  @protected
  void setState([VoidCallback? fn]) {
    fn?.call();

    (context as CuteElement).markNeedsBuild();
  }

  // Called after the widget model has been created.
  @protected
  void init() {}

  /// Called whenever the widget configuration changes.
  ///
  /// https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html
  @protected
  void didUpdateWidget(W oldWidget) {}

  /// Called when a dependency of this Widget Model changes.
  ///
  /// https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html
  @protected
  void didChangeDependencies() {}

  /// Called when this object is reinserted into the tree after having been
  /// removed via [deactivate].
  ///
  /// https://api.flutter.dev/flutter/widgets/State/activate.html
  @protected
  void activate() {}

  /// Called when this object is removed from the tree.
  ///
  /// https://api.flutter.dev/flutter/widgets/State/deactivate.html
  @protected
  void deactivate() {}

  /// Called when this object is removed from the tree permanently.
  ///
  /// https://api.flutter.dev/flutter/widgets/State/dispose.html
  @protected
  void dispose() {}

  /// Called whenever the application is reassembled during debugging,
  /// for example during hot reload.
  ///
  /// https://api.flutter.dev/flutter/widgets/State/reassemble.html
  @protected
  void reassemble() {}

  /// A handle to the location of a widget in the widget tree.
  @protected
  BuildContext get context {
    assert(() {
      if (_element == null) {
        throw FlutterError('This widget has been unmounted');
      }
      return true;
    }());
    return _element!;
  }

  /// The current configuration.
  @protected
  W get widget => _widget!;

  /// Whether this [WidgetModel] object is currently in a tree.
  bool get mounted => _element != null;

  CuteElement? _element;
  W? _widget;
}

class CuteElement extends ComponentElement {
  CuteElement(CuteWidget widget) : super(widget);

  late WidgetModel _wm;
  bool _isInitialized = false;

  @override
  CuteWidget get widget => super.widget as CuteWidget;

  @override
  Widget build() => widget.build(_wm);

  @override
  void reassemble() {
    super.reassemble();

    _wm.reassemble();
  }

  @override
  void performRebuild() {
    if (!_isInitialized) {
      _wm = widget.wmFactory(this)
        .._element = this
        .._widget = widget
        ..init()
        ..didChangeDependencies();

      _isInitialized = true;
    }

    super.performRebuild();
  }

  @override
  void update(CuteWidget newWidget) {
    super.update(newWidget);

    final oldWidget = _wm.widget;
    _wm
      .._widget = newWidget
      ..didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    super.activate();
    _wm.activate();

    markNeedsBuild();
  }

  @override
  void deactivate() {
    _wm.deactivate();
    super.deactivate();
  }

  @override
  void unmount() {
    super.unmount();

    _wm
      ..dispose()
      .._element = null
      .._widget = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _wm.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<WidgetModel>(
        'widget model',
        _wm,
        defaultValue: null,
      ),
    );
  }
}
