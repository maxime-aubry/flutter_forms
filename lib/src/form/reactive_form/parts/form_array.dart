import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [FormArray] is a sub-class of [AbstractControl].
///
/// It's a way to group form elements.
///
/// [FormArray] can contain [FormGroup] items only.
/// {@category Form}
/// {@subCategory Reactive forms}
class FormArray extends AbstractControl {
  /* Public properties */
  /// [groups] is a collection of [FormGroup] items.
  List<FormGroup> groups;

  /* Protected properties */

  /* Private properties */

  /* Getters */
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
  FormArray({
    @required List<FormGroup> groups,
    @required List<FormValidatorAnnotation> validators,
  }) : super(validators) {
    this.groups = groups ?? [];
  }

  /* Public methods */
  /// [initialize] initializes the current [FormArray].
  /// This sets :
  ///   - the [FormArray] name.
  ///   - the parent [FormGroup] (except for the root, that's the top level of the form).
  ///   - the ReactiveFormState.
  /// This also indexes current [FormArray] into [FormIndexer] and initialize sub form elements.
  void initialize(
    String name,
    FormGroup parentGroup,
    ReactiveFormState formState,
  ) {
    if (name == null || name.isEmpty)
      throw new FormBuilderException(
          'Cannot initialize FormArray if its name is not provided.');

    if (this.isInitialized)
      throw new FormBuilderException(
          'Cannot initialize an already initialized FormArray.');

    super.name = name;
    super.parent = parentGroup;
    super.formState = formState;
    super.index();
    this._initializeItems();
    super.isInitialized = true;
  }

  /// [deindex] removes the current [FormArray] from FormIndexer if you want to remove this [FormArray] from the form.
  @override
  void deindex() {
    this._deindexItems();
    super.deindex();
  }

  /// [addGroup] adds a [FormGroup] item to the collection into this [FormArray].
  /// After adding it, this new item is initialized, and its sub form elements too.
  /// Then, current [FormArray] is validated.
  /// Notify listeners.
  void addGroup(
    FormGroup formGroup, {
    bool notify = true,
  }) async {
    if (formGroup == null)
      throw new FormBuilderException(
          'Cannot add FormGroup if this one is null.');

    FormGroup item = formGroup.clone(null);
    this.groups.add(item);
    this._initializeItem(item);
    await this.validate();
    if (notify) super.notifyListeners();
  }

  /// [removeGroup] removes an item from the collection of this [FormArray].
  /// Removed item is deindexed. That means it's removed form [FormIndexer].
  /// FormArray collection of items is reindexed. That means each item name is updated.
  /// Then, current [FormArray] is validated.
  /// Notify listeners.
  void removeGroup(
    FormGroup formGroup, {
    bool notify = true,
  }) async {
    if (formGroup == null)
      throw new FormBuilderException(
          'Cannot add FormGroup if this one is null.');

    if (!this.groups.contains(formGroup))
      throw new FormBuilderException(
          'Cannot remove FormGroup if this one is not registered.');

    this._deindexItem(formGroup);
    this.groups.remove(formGroup);
    this.reindexFormArrayItems();
    await this.validate();
    if (notify) super.notifyListeners();
  }

  /// [getClone] make a clone of the full form and returns the current [FormArray].
  FormArray getClone() {
    ReactiveFormBuilder formBuilder = this.root.formBuilder.clone();
    FormArray currentClone =
        formBuilder.indexer.getFormArrayByFormPath(this.formPath);
    return currentClone;
  }

  /// [clone] make a clone of a form element and its sub form elements.
  FormArray clone(FormGroup clonedParent) {
    FormArray clone = new FormArray(
      groups: [],
      validators: this.validators,
    );

    clone.error = super.error?.copyWith();
    this._cloneItems(clone);
    return clone;
  }

  /// [validate] validates the current [FormArray].
  Future validate() async => await super.validateControl();

  /* Protected methods */
  @protected
  void reindexFormArrayItems({
    bool notify = true,
  }) {
    for (FormGroup group in this.groups)
      this._reindexFormArrayItem(group, notify: notify);
  }

  /* Private methods */
  String _getIndexedFormArrayItemName(FormGroup item) {
    int index = this.groups.indexOf(item);
    String indexedName = '${this.name}[$index]';
    return indexedName;
  }

  void _reindexFormArrayItem(
    FormGroup item, {
    bool notify = true,
  }) {
    item.name = this._getIndexedFormArrayItemName(item);
    if (notify) item.notifyListeners();
  }

  void _initializeItems() {
    for (FormGroup item in this.groups) this._initializeItem(item);
  }

  void _initializeItem(FormGroup item) {
    String indexedName = this._getIndexedFormArrayItemName(item);
    item.initialize(indexedName, this.parent, true, this.formState);
  }

  void _cloneItems(FormArray clone) {
    for (FormGroup formGroup in this.groups) {
      FormGroup clonedItem = formGroup.clone(clone.parent);
      clone.addGroup(clonedItem);
    }
  }

  void _deindexItems() {
    for (FormGroup item in this.groups) this._deindexItem(item);
  }

  void _deindexItem(FormGroup item) => item.deindex();
}
