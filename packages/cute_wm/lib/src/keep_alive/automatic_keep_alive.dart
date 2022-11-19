import 'package:cute_wm/cute_wm.dart';
import 'package:flutter/material.dart';

/// A mixin with convenience methods for clients of [AutomaticKeepAlive]. Used
/// with [WidgetModel] subclasses.
///
/// Subclasses must implement [wantKeepAlive].
///
/// Then, whenever [wantKeepAlive]'s value changes (or might change), the
/// subclass should call [updateKeepAlive].
///
/// The type argument `T` is the type of the [CuteWidget] subclass of the
/// [WidgetModel] into which this class is being mixed.
///
/// See also:
///
///  * [AutomaticKeepAlive], which listens to messages from this mixin.
///  * [KeepAliveNotification], the notifications sent by this mixin.
mixin AutomaticKeepAliveWidgetModelMixin<W extends CuteWidget>
    on WidgetModel<W> {
  KeepAliveHandle? _keepAliveHandle;

  void _ensureKeepAlive() {
    assert(_keepAliveHandle == null);
    _keepAliveHandle = KeepAliveHandle();
    KeepAliveNotification(_keepAliveHandle!).dispatch(context);
  }

  void _releaseKeepAlive() {
    // Dispose and release do not imply each other.
    _keepAliveHandle!.dispose();
    _keepAliveHandle = null;
  }

  /// Whether the current instance should be kept alive.
  ///
  /// Call [updateKeepAlive] whenever this getter's value changes.
  @protected
  bool get wantKeepAlive;

  /// Ensures that any [AutomaticKeepAlive] ancestors are in a good state, by
  /// firing a [KeepAliveNotification] or triggering the [KeepAliveHandle] as
  /// appropriate.
  void updateKeepAlive() {
    if (wantKeepAlive) {
      if (_keepAliveHandle == null) {
        _ensureKeepAlive();
      }
    } else {
      if (_keepAliveHandle != null) {
        _releaseKeepAlive();
      }
    }
  }

  @override
  void init() {
    super.init();

    if (wantKeepAlive) {
      _ensureKeepAlive();
    }
  }

  @override
  void deactivate() {
    if (_keepAliveHandle != null) {
      _releaseKeepAlive();
    }
    super.deactivate();
  }
}
