import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [FormControlProvider] with [TProperty] generic type provides a [FormControl] to a form.
///
/// Use it when you want instanciate a [FormControl] into the provider.
///
/// How to use it :
///
/// ``` dart
/// child: new FormControlProvider<TProperty>(
///   create: (_) => new FormControl<TProperty>(),
///   builder: (context, _) {
///     return new Container();
///   },
/// );
/// ```
class FormControlProvider<TProperty>
    extends ChangeNotifierProvider<FormControl<TProperty>> {
  FormControlProvider({
    Key key,
    @required Create<FormControl<TProperty>> create,
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

  /// [of] provides a [FormControl] with [TProperty] generic type.
  ///
  /// If [listen] is [True], [FormControl] will refresh each time the object will change.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormControl<TProperty> formControl = FormControlProvider<TProperty>.of(context, listen: true);
  /// ```
  static FormControl<TProperty> of<TProperty>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<FormControl<TProperty>>(context, listen: listen);

  /// [FormControlProvider] provides a [FormControl] to a form.
  ///
  /// Use it when you want to instanciate a [FormControl] outside the provider.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormControl<TProperty> formControl = // ...
  ///
  /// child: new FormControlProvider<TProperty>.value(
  ///   value: formControl,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  FormControlProvider.value({
    Key key,
    @required FormControl<TProperty> value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension FormControlProviderExtension on BuildContext {
  /// [readFormControl] gets a [FormControl] object.
  ///
  /// If a widget use this object, it won't rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormControl<TProperty> formControl = context.readFormControl<TProperty>();
  /// ```
  FormControl<TProperty> readFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: false);

  /// [watchFormControl] gets a [FormControl] object.
  ///
  /// If a widget use this object, it will rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormControl<TProperty> formControl = context.watchFormControl<TProperty>();
  /// ```
  FormControl<TProperty> watchFormControl<TProperty>() =>
      FormControlProvider.of<TProperty>(this, listen: true);
}
