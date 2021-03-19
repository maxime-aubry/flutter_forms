import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [FormGroupProvider] provides a [FormGroup] to a form.
///
/// Use it when you want to instanciate a [FormGroup] into the provider.
///
/// How to use it :
///
/// ``` dart
/// child: new FormGroupProvider(
///   create: (_) => new FormGroup(),
///   builder: (context, _) {
///     return new Container();
///   },
/// );
/// ```
/// {@category Providers and Consumers}
/// {@subCategory Providers}
class FormGroupProvider extends ChangeNotifierProvider<FormGroup> {
  FormGroupProvider({
    Key key,
    @required Create<FormGroup> create,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  /// [of] provides a [FormGroup].
  ///
  /// If [listen] is [True], [FormGroup] will refresh each time the object will change.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormGroup formGroup = FormGroupProvider.of(context, listen: true);
  /// ```
  static FormGroup of(BuildContext context, {bool listen = true}) =>
      Provider.of<FormGroup>(context, listen: listen);

  /// [FormGroupProvider] provides a [FormGroup] to a form.
  ///
  /// Use it when you want to instanciate a [FormGroup] outside the provider.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormGroup formGroup = // ...
  ///
  /// child: new FormGroupProvider.value(
  ///   value: formGroup,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  FormGroupProvider.value({
    Key key,
    @required FormGroup value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension FormGroupProviderExtension on BuildContext {
  /// [readFormGroup] gets a [FormGroup] object.
  ///
  /// If a widget use this object, it won't rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormGroup formGroup = context.readFormGroup();
  /// ```
  FormGroup readFormGroup() => FormGroupProvider.of(this, listen: false);

  /// [watchFormGroup] gets a [FormGroup] object.
  ///
  /// If a widget use this object, it will rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormGroup formGroup = context.watchFormGroup();
  /// ```
  FormGroup watchFormGroup() => FormGroupProvider.of(this, listen: true);
}
