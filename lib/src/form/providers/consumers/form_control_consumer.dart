import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [FormControlConsumer] with [TProperty] generic type listens for changes on last provided [FormControl].
///
/// How to use it :
///
/// ``` dart
/// child: new FormControlConsumer<TProperty>(
///   builder: (context, formControl, child) {
///     return new Container();
///   },
/// );
/// ```
class FormControlConsumer<TProperty> extends Consumer<FormControl<TProperty>> {
  FormControlConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormControl<TProperty> formControl,
    Widget child,
  ) builder;
}
