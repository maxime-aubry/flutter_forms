import 'package:flutter/widgets.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:flutter_forms/src/form/providers/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';
import 'package:provider/single_child_widget.dart';

/// [ReactiveForm] declares a new form.
///
/// How to use it :
///
/// ``` dart
/// return ReactiveForm(
///   formBuilder: this._getFormBuilder(), // define this method provides a ReactiveFormBuilder
///   builder: (context, _) {
///     return new Container();
///   },
/// );
/// ```
///
/// How to use it if form has multiple steps :
///
/// ``` dart
/// return ReactiveForm(
///   formBuilder: this._getFormBuilder(), // define this method provides a ReactiveFormBuilder
///   step: 'step1',
///   builder: (context, _) {
///     return new Container();
///   },
/// );
/// ```
class ReactiveForm extends SingleChildStatefulWidget {
  /* Public properties */
  final ReactiveFormBuilder formBuilder;
  final ReactiveFormState formState;
  final String step;
  final TransitionBuilder builder;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  ReactiveForm({
    Key key,
    Widget child,
    TransitionBuilder builder,
    @required this.formBuilder,
    String step,
  })  : this.formState = new ReactiveFormState(),
        this.step = step,
        this.builder = builder,
        super(key: key, child: child) {
    this.formBuilder.initialize(this.formState);
  }

  /* Public methods */
  @override
  SingleChildState<ReactiveForm> createState() => _ReactiveFormState();

  /* Protected methods */

  /* Private methods */
}

class _ReactiveFormState extends SingleChildState<ReactiveForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.formState.attachFormKey(this._formKey);
  }

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    this._registerStepFormState();

    return Form(
      key: this._formKey,
      autovalidateMode: AutovalidateMode.always,
      child: new FormProvider(
        providers: [
          new ReactiveFormStateProvider.value(value: widget.formState),
          new FormGroupProvider.value(value: widget.formBuilder.group),
        ],
        builder: widget.builder,
        child: child,
      ),
    );
  }

  void _registerStepFormState() {
    try {
      if (widget.step != null) {
        MultipleStepFormStateIndexer indexer =
            context.readMultipleStepFormStateIndexer();
        indexer.addFormState(widget.step, widget.formState);
      }
    } catch (e) {
      throw new Exception('Cannot register FormState of this step.');
    }
  }
}
