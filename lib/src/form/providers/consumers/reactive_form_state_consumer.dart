import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [ReactiveFormStateConsumer] listens for changes on last provided [ReactiveFormState].
///
/// How to use it :
///
/// ``` dart
/// child: new ReactiveFormStateConsumer(
///   builder: (context, formState, child) {
///     return new Container();
///   },
/// );
/// ```
/// {@category Providers and Consumers}
/// {@subCategory Consumers}
class ReactiveFormStateConsumer extends Consumer<ReactiveFormState> {
  ReactiveFormStateConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    ReactiveFormState formState,
    Widget child,
  ) builder;
}
