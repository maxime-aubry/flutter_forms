import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [FormGroupConsumer] listens for changes on last provided [FormGroup].
/// 
/// How to use it :
/// 
/// ``` dart
/// child: new FormGroupConsumer(
///   builder: (context, formGroup, child) {
///     return new Container();
///   },
/// );
/// ```
/// {@category Providers}
/// {@subCategory Consumers}
class FormGroupConsumer extends Consumer<FormGroup> {
  FormGroupConsumer({
    Key key,
    @required this.builder,
    Widget child,
  })  : assert(builder != null),
        super(key: key, builder: builder, child: child);

  @override
  final Widget Function(
    BuildContext context,
    FormGroup formGroup,
    Widget child,
  ) builder;
}
