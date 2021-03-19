import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:provider/single_child_widget.dart';

/// [MultipleStepFormContainer] declares a new form.
///
/// How to use it :
///
/// ``` dart
/// return MultipleStepFormContainer(
///   builder: (context, _) {
///     return new Stepper(
///       // define your stepper here
///     );
///   },
/// );
/// ```
/// {@category Form}
/// {@subCategory Reactive forms}
class MultipleStepFormContainer extends SingleChildStatefulWidget {
  final TransitionBuilder builder;

  MultipleStepFormContainer({
    Key key,
    @required this.builder,
    Widget child,
  }) : super(key: key, child: child) {}

  @override
  SingleChildState<MultipleStepFormContainer> createState() =>
      _MultipleStepFormContainerState();
}

class _MultipleStepFormContainerState
    extends SingleChildState<MultipleStepFormContainer> {
  @override
  Widget buildWithChild(BuildContext context, Widget child) =>
      new MultipleStepFormStateIndexerProvider(
        create: (_) => new MultipleStepFormStateIndexer(),
        builder: widget.builder,
        child: child,
      );
}
