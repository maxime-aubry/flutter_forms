import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [FormGroup] is a sub-class of [AbstractControl].
/// 
/// It's a way to group form elements.
/// 
/// [FormGroup] can contain [FormGroup], [FormArray] and [FormControl] elements.
/// {@category Form}
/// {@subCategory Reactive forms}
class FormGroup extends AbstractControl {
  /* Public properties */
  /// [isArrayItem] permits to know if current [FormGroup] is a FormArray item.
  bool isArrayItem;

  /// [controls] is the collection of sub form elements.
  /// They can be [FormGroup], [FormArray] or [FormControl].
  Map<String, AbstractControl> controls;

  /* Protected properties */

  /* Private properties */

  /* Getters */
  @override
  String get formPath {
    String part = (this.parent != null) ? '${this.parent.formPath}' : 'root';

    if (this.parent != null) {
      String key = this.name.split('[')[0];
      if (this.isArrayItem && this.parent.controls[key] is FormArray) {
        FormArray formArray = this.parent.controls[key] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.controls[\'$key\'].groups[$index]';
      } else {
        part += '.controls[\'${this.name}\']';
      }
    }

    return part;
  }

  @override
  String get modelPath {
    String part = (this.parent != null) ? '${this.parent.modelPath}' : 'root';

    if (this.parent != null) {
      if (this.isArrayItem && this.parent.controls[this.name] is FormArray) {
        FormArray formArray = this.parent.controls[this.name] as FormArray;
        int index = formArray.groups.indexOf(this);
        part += '.${this.name}[$index]';
      } else {
        part += '.${this.name}';
      }
    }

    return part;
  }

  /* Setters */

  /* Constructors */
  FormGroup({
    @required Map<String, AbstractControl> controls,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.controls = controls ?? new Map<String, AbstractControl>();
  }

  /* Public methods */
  /// [initialize] initializes the current [FormGroup].
  /// This sets :
  ///   - the [FormGroup] name.
  ///   - the parent [FormGroup] (except for the root, that's the top level of the form).
  ///   - the ReactiveFormState.
  ///   - the boolean value to know if current [FormGroup] is a [FormArray] item.
  /// This also indexes current [FormGroup] into [FormIndexer] and initialize sub form elements.
  void initialize(
    String name,
    FormGroup parentGroup,
    bool isArrayItem,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize FormGroup if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized FormGroup.');

    super.name = name;
    super.parent = parentGroup;
    super.formState = formState;
    super.index();
    this.isArrayItem = isArrayItem;
    this._initializeControls();
    super.isInitialized = true;
  }

  /// [deindex] removes the current [FormGroup] from FormIndexer if you want to remove this [FormGroup] from the form.
  @override
  void deindex() {
    this._deindexControls();
    super.deindex();
  }

  /// [containsControl] checks if the current [FormGroup] contains a form element using by its name.
  bool containsControl(String name) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot check if control does exist if its name is not provided.');

    bool hasKey = this.controls.containsKey(name);
    return hasKey;
  }

  /// [addControl] adds an abstract control into this [FormGroup].
  /// After adding it, this new sub form element is initialized, and its sub form elements too.
  /// Notify listeners.
  void addControl(String name, AbstractControl control) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot add control if its name is not provided.');

    if (control == null)
      throw new FormBuilderException('Cannot add control if this one is null.');

    if (this.controls.containsKey(name))
      throw new FormBuilderException(
          'Cannot add control if this one is already added.');

    this.controls[name] = control;
    this._initializeControl(name, control);
    super.notifyListeners();
  }

  /// [removeControl] removes an abstract control from this [FormGroup].
  /// Notify listeners.
  void removeControl(String name) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot remove control if its name is not provided.');

    if (!this.controls.containsKey(name))
      throw new FormBuilderException(
          'Cannot remove control if this one is not registered.');

    this._deindexControl(name);
    this.controls.remove(name);
    super.notifyListeners();
  }

  /// [getClone] make a clone of the full form and returns the current [FormGroup].
  FormGroup getClone() {
    ReactiveFormBuilder formBuilder = this.root.formBuilder.clone();
    FormGroup currentClone =
        formBuilder.indexer.getFormGroupByFormPath(this.formPath);
    return currentClone;
  }

  /// [clone] make a clone of a form element and its sub form elements.
  FormGroup clone(FormGroup clonedParent) {
    FormGroup clone = new FormGroup(
      controls: {},
      validators: this.validators,
    );
    this._cloneControls(clone);
    return clone;
  }

  /// [getFormGroup] gets a sub [FormGroup] of the current [FormGroup] using by its name.
  FormGroup getFormGroup(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('FormGroup not found.');

    if (this.controls[name] is! FormGroup)
      throw new FormBuilderException('Control is not of FormGroup type.');

    FormGroup formGroup = this.controls[name] as FormGroup;
    return formGroup;
  }

  /// [getFormGroup] gets a sub [FormArray] of the current [FormGroup] using by its name.
  FormArray getFormArray(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('FormArray not found.');

    if (this.controls[name] is! FormArray)
      throw new FormBuilderException('Control is not of FormArray type.');

    FormArray formArray = this.controls[name] as FormArray;
    return formArray;
  }

  /// [getFormGroup] gets a sub [FormControl] with [TProperty] generiuc type of the current [FormGroup] using by its name.
  FormControl<TProperty> getFormControl<TProperty>(String name) {
    if (!this.containsControl(name))
      throw new FormBuilderException('FormControl not found.');

    if (this.controls[name] is! FormControl<TProperty>)
      throw new FormBuilderException(
          'Control is not of FormControl<$TProperty> type.');

    FormControl<TProperty> formControl =
        this.controls[name] as FormControl<TProperty>;
    return formControl;
  }

  /// [validate] validates the current [FormGroup].
  Future validate() async => await super.validateControl();

  /* Protected methods */
  @protected
  void clearControls() {
    this.controls.clear();
    super.notifyListeners();
  }

  /* Private methods */
  void _initializeControls() {
    for (MapEntry<String, AbstractControl> control in this.controls.entries)
      this._initializeControl(control.key, control.value);
  }

  void _initializeControl(String name, AbstractControl control) {
    if (control is FormGroup)
      control.initialize(name, this, false, this.formState);
    if (control is FormArray) control.initialize(name, this, this.formState);
    if (control is FormControl) control.initialize(name, this, this.formState);
  }

  void _cloneControls(FormGroup clone) {
    for (MapEntry<String, AbstractControl> control in this.controls.entries) {
      if (control.value is FormGroup) {
        FormGroup child = (control.value as FormGroup).clone(clone);
        clone.controls[control.key] = child;
      }

      if (control.value is FormArray) {
        FormArray child = (control.value as FormArray).clone(clone);
        clone.controls[control.key] = child;
      }

      if (control.value is FormControl) {
        FormControl child = (control.value as FormControl).clone(clone);
        clone.controls[control.key] = child;
      }
    }
  }

  void _deindexControls() {
    for (MapEntry<String, AbstractControl> control in this.controls.entries)
      this._deindexControl(control.key);
  }

  void _deindexControl(String name) {
    AbstractControl control = this.controls[name];
    if (control is FormGroup) control.deindex();
    if (control is FormArray) control.deindex();
    if (control is FormControl) control.deindex();
  }
}
