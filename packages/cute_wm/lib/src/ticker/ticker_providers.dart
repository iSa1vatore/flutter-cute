import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

/// Provides a single [Ticker] that is configured to only tick while the current
/// tree is enabled, as defined by [TickerMode].
///
/// To create the [AnimationController] in a [WidgetModel] that only uses
/// a single [AnimationController], mix in this class, then pass `vsync: this`
/// to the animation controller constructor.
///
/// This mixin only supports vending a single ticker. If you might have multiple
/// [AnimationController] objects over the lifetime of the [State], use a full
/// [TickerProviderWidgetModelMixin] instead.
mixin SingleTickerProviderWidgetModelMixin<W extends CuteWidget>
    on WidgetModel<W> implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) return true;
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(
            '$runtimeType is a SingleTickerProviderWidgetModelMixin but multiple tickers were created.',
          ),
          ErrorDescription(
            'A SingleTickerProviderWidgetModelMixin can only be used as a TickerProvider once.',
          ),
          ErrorHint(
            'If a WidgetModel is used for multiple AnimationController objects, or if it is passed to other '
            'objects and those objects might use it more than one time in total, then instead of '
            'mixing in a SingleTickerProviderWidgetModelMixin, implement your own TickerProviderWidgetModelMixin.',
          ),
        ],
      );
    }());
    _ticker = Ticker(
      onTick,
      debugLabel: kDebugMode ? 'created by $this' : null,
    );
    return _ticker!;
  }

  @override
  void dispose() {
    assert(() {
      if (_ticker == null || !_ticker!.isActive) return true;
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(
            '$this was disposed with an active Ticker.',
          ),
          ErrorDescription(
            '$runtimeType created a Ticker via its SingleTickerProviderWidgetModelMixin, but at the time '
            'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
            'be disposed before calling super.dispose().',
          ),
          ErrorHint(
            'Tickers used by AnimationControllers '
            'should be disposed by calling dispose() on the AnimationController itself. '
            'Otherwise, the ticker will leak.',
          ),
          _ticker!.describeForError('The offending ticker was'),
        ],
      );
    }());
    super.dispose();
  }
}

/// Provides [Ticker] objects that are configured to only tick while the current
/// tree is enabled, as defined by [TickerMode].
///
/// To create an [AnimationController] in a class that uses this mixin, pass
/// `vsync: this` to the animation controller constructor whenever you
/// create a new animation controller.
///
/// If you only have a single [Ticker] (for example only a single
/// [AnimationController]) for the lifetime of your [WidgetModel], then using a
/// [SingleTickerProviderWidgetModelMixin] is more efficient.
/// This is the common case.
mixin TickerProviderWidgetModelMixin<W extends CuteWidget> on WidgetModel<W>
    implements TickerProvider {
  final _tickers = <Ticker>{};

  @override
  Ticker createTicker(TickerCallback onTick) {
    final result = _WidgetTicker(onTick, this, debugLabel: 'created by $this');
    _tickers.add(result);
    return result;
  }

  void _removeTicker(_WidgetTicker ticker) {
    assert(_tickers.contains(ticker));
    _tickers.remove(ticker);
  }

  @override
  void dispose() {
    assert(() {
      for (final ticker in _tickers) {
        if (ticker.isActive) {
          throw FlutterError.fromParts(
            <DiagnosticsNode>[
              ErrorSummary(
                '$this was disposed with an active Ticker.',
              ),
              ErrorDescription(
                '$runtimeType created a Ticker via its TickerProviderWidgetModelMixin, but at the time '
                'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
                'be disposed before calling super.dispose().',
              ),
              ErrorHint(
                'Tickers used by AnimationControllers '
                'should be disposed by calling dispose() on the AnimationController itself. '
                'Otherwise, the ticker will leak.',
              ),
              ticker.describeForError('The offending ticker was'),
            ],
          );
        }
      }
      return true;
    }());

    super.dispose();
  }
}

// This class should really be called _DisposingTicker or some such, but this
// class name leaks into stack traces and error messages and that name would be
// confusing. Instead we use the less precise but more anodyne "_WidgetTicker",
// which attracts less attention.
class _WidgetTicker extends Ticker {
  final TickerProviderWidgetModelMixin _creator;

  _WidgetTicker(
    TickerCallback onTick,
    this._creator, {
    String? debugLabel,
  }) : super(
          onTick,
          debugLabel: debugLabel,
        );

  @override
  void dispose() {
    _creator._removeTicker(this);
    super.dispose();
  }
}
