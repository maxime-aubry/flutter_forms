import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [FormArrayProvider] provides a [FormArray] to a form.
///
/// Use it when you want to instanciate a [FormArray] into the provider.
///
/// How to use it :
///
/// ``` dart
/// child: new FormArrayProvider(
///   create: (_) => new FormArray(),
///   builder: (context, _) {
///     return new Container();
///   },
/// );
/// ```
/// {@category Form}
/// {@subCategory Providers}
class FormArrayProvider extends ChangeNotifierProvider<FormArray> {
  FormArrayProvider({
    Key key,
    @required Create<FormArray> create,
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

  /// [of] provides a [FormArray].
  ///
  /// If [listen] is [True], [FormArray] will refresh each time the object will change.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormArray formArray = FormArrayProvider.of(context, listen: true);
  /// ```
  static FormArray of(BuildContext context, {bool listen = true}) =>
      Provider.of<FormArray>(context, listen: listen);

  /// [FormArrayProvider] provides a [FormArray] to a form.
  ///
  /// Use it when you want to instanciate a [FormArray] outside the provider.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormArray formArray = // ...
  ///
  /// child: new FormArrayProvider.value(
  ///   value: formArray,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  FormArrayProvider.value({
    Key key,
    @required FormArray value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension FormArrayProviderExtension on BuildContext {
  /// [readFormArray] gets a [FormArray] object.
  ///
  /// If a widget use this object, it won't rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormArray formArray = context.readFormArray();
  /// ```
  FormArray readFormArray() => FormArrayProvider.of(this, listen: false);

  /// [watchFormArray] gets a [FormArray] object.
  ///
  /// If a widget use this object, it will rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// FormArray formArray = context.watchFormArray();
  /// ```
  FormArray watchFormArray() => FormArrayProvider.of(this, listen: true);
}
