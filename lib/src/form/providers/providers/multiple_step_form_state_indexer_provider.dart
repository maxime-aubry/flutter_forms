import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/provider.dart';

/// [MultipleStepFormStateIndexerProvider] provides [MultipleStepFormStateIndexer].
/// {@category Form}
/// {@subCategory Providers}
class MultipleStepFormStateIndexerProvider
    extends Provider<MultipleStepFormStateIndexer> {
  MultipleStepFormStateIndexerProvider({
    Key key,
    @required Create<MultipleStepFormStateIndexer> create,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          builder: builder,
          child: child,
        );

  /// [of] provides a [MultipleStepFormStateIndexer].
  ///
  /// If [listen] is [True], [MultipleStepFormStateIndexer] will refresh each time the object will change.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   MultipleStepFormStateIndexerProvider.of(context, listen: true);
  /// ```
  static MultipleStepFormStateIndexer of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<MultipleStepFormStateIndexer>(context, listen: listen);

  /// [MultipleStepFormStateIndexerProvider] provides a [MultipleStepFormStateIndexer] to a form.
  ///
  /// Use it when you want to instanciate a [MultipleStepFormStateIndexer] outside the provider.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer = // ...
  ///
  /// child: new MultipleStepFormStateIndexerProvider.value(
  ///   value: indexer,
  ///   builder: (context, _) {
  ///     return new Container();
  ///   },
  /// );
  /// ```
  MultipleStepFormStateIndexerProvider.value({
    Key key,
    @required MultipleStepFormStateIndexer value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          value: value,
          builder: builder,
          child: child,
        );
}

extension MultipleStepFormStateIndexerExtension on BuildContext {
  /// [readMultipleStepFormStateIndexer] gets a [MultipleStepFormStateIndexer] object.
  ///
  /// If a widget use this object, it won't rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.readMultipleStepFormStateIndexer();
  /// ```
  ///
  /// How to use it if form has multiple steps :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.readMultipleStepFormStateIndexer(step: 'step1');
  /// ```
  MultipleStepFormStateIndexer readMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: false);

  /// [watchMultipleStepFormStateIndexer] gets a [MultipleStepFormStateIndexer] object.
  ///
  /// If a widget use this object, it will rebuild when object changes.
  ///
  /// How to use it :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.watchMultipleStepFormStateIndexer();
  /// ```
  ///
  /// How to use it if form has multiple steps :
  ///
  /// ``` dart
  /// MultipleStepFormStateIndexer indexer =
  ///   context.watchMultipleStepFormStateIndexer(step: 'step1');
  /// ```
  MultipleStepFormStateIndexer watchMultipleStepFormStateIndexer() =>
      MultipleStepFormStateIndexerProvider.of(this, listen: true);
}
