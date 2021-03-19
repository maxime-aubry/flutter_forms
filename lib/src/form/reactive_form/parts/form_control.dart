import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/form_control_filter/index.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [FormControl] is a sub-class of [AbstractControl].
///
/// It's a way set data.
///
class FormControl<TProperty> extends AbstractControl
    with FormControlFilter<TProperty> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  TProperty _value;

  /* Getters */
  TProperty get value => this._value;

  @override
  String get formPath {
    String part = (this.parent != null) ? '${this.parent.formPath}' : null;
    part += '.controls[\'${this.name}\']';
    return part;
  }

  @override
  String get modelPath {
    String part = (this.parent != null) ? '${this.parent.modelPath}' : null;
    part += '.${this.name}';
    return part;
  }

  /* Setters */

  /* Constructors */
  FormControl({
    @required TProperty value,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    // check if TProperty is an allowed type
    // throw an exception if not
    super.checkAllowedFormControlType();
    this._value = value;
  }

  /* Public methods */
  /// [initialize] initializes the current [FormControl].
  /// This sets :
  ///   - the [FormGroup] name.
  ///   - the parent [FormGroup] (except for the root, that's the top level of the form).
  ///   - the ReactiveFormState.
  /// This also indexes current [FormGroup] into [FormIndexer] and initialize sub form elements.
  void initialize(
    String name,
    FormGroup parentGroup,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize form control if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized form control.');

    super.name = name;
    super.parent = parentGroup;
    super.formState = formState;
    super.index();
    super.isInitialized = true;
  }

  /// [deindex] removes the current [FormControl] from FormIndexer if you want to remove this [FormControl] from the form.
  @override
  void deindex() => super.deindex();

  /// [setValue] sets the [FormControl] value.
  /// It's possible to validate it after.
  Future<void> setValue(TProperty value, {bool validate = true}) async {
    // does not accept empty string value
    if (TProperty == String) {
      String _value = value as String;
      this._value = (_value.isEmpty) ? null : value;
    } else {
      this._value = value;
    }

    if (validate) await super.validateControl();
  }

  /// [getClone] make a clone of the full form and returns the current [FormControl].
  FormControl<TProperty> getClone() {
    ReactiveFormBuilder formBuilder = this.root.formBuilder.clone();
    FormControl<TProperty> currentClone =
        formBuilder.indexer.getFormControlByFormPath<TProperty>(this.formPath);
    return currentClone;
  }

  /// [clone] make a clone of a form element and its sub form elements.
  FormControl<TProperty> clone(FormGroup clonedParent) {
    TProperty newValue = (this._value is List)
        ? ([]..addAll(this._value as List<TProperty>))
        : this._value;

    FormControl<TProperty> clone = new FormControl<TProperty>(
      value: newValue,
      validators: super.validators,
    );

    return clone;
  }

  /// [validate] validates the current [FormControl].
  Future<void> validate() async => await super.validateControl();

  /* Protected methods */

  /* Private methods */
}
