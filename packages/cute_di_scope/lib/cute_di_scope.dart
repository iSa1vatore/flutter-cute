library cute_di_scope;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function(BuildContext context);

/// Async factory that returns the dependency scope.
typedef AsyncScopeFactory<T> = Future<T> Function(BuildContext context);

/// Di container. T - return type(for example [DashboardScope]).
class CuteDiScope<T> extends StatelessWidget {
  const CuteDiScope({
    Key? key,
    required ScopeFactory<T> factory,
    required this.child,
  })  : _factory = factory,
        _asyncFactory = null,
        placeholderBuilder = null,
        super(key: key);

  const CuteDiScope.async({
    Key? key,
    required AsyncScopeFactory<T> factory,
    required this.placeholderBuilder,
    required this.child,
  })  : _factory = null,
        _asyncFactory = factory,
        super(key: key);

  final AsyncScopeFactory<T>? _asyncFactory;

  final ScopeFactory<T>? _factory;

  /// The widgets below this widgets in the tree.
  final Widget child;

  /// Shown instead of a [child] while an asynchronous operation is in progress.
  final WidgetBuilder? placeholderBuilder;

  @override
  Widget build(BuildContext context) {
    if (_factory != null) {
      return Provider<T>(
        create: _factory!,
        child: child,
      );
    }

    return FutureBuilder<T>(
      future: _asyncFactory!.call(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return placeholderBuilder!(context);
        }

        return Provider(
          create: (_) => snapshot.data,
          child: child,
        );
      },
    );
  }
}
