import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/form_indexer.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [ReactiveFormBuilder] will build your form.
class ReactiveFormBuilder {
  /* Public properties */
  bool isInitialized;
  FormGroup group;
  ReactiveFormState formState;
  FormIndexer indexer;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  ReactiveFormBuilder({
    @required this.group,
  }) {
    this.isInitialized = false;
    this.indexer = new FormIndexer();
  }

  /* Public methods */
  /// [initialize] initializes the current [ReactiveFormBuilder].
  /// This sets the [ReactiveFormState] and initializes the root [FormGroup].
  void initialize(ReactiveFormState formState) {
    if (formState == null)
      throw new FormBuilderException(
          'Cannot initialize ReactiveFormBuilder if ReactiveFormState is not provided.');

    this.formState = formState;
    this.formState.formBuilder = this;
    this.group.initialize('root', null, false, this.formState);
    this.isInitialized = true;
  }

  /// [clone] make a clone of a [ReactiveFormBuilder] and the complete tree of form elements.
  ReactiveFormBuilder clone() {
    FormGroup root = this.group.clone(null);
    ReactiveFormState formState = new ReactiveFormState();
    ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(group: root);
    formBuilder.initialize(formState);
    return formBuilder;
  }

  /* Protected methods */

  /* Private methods */
}
