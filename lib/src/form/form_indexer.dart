import 'dart:collection';

import 'package:flutter_forms/src/form/index.dart';
import 'package:queries/collections.dart';

/// [FormIndexer] indexes all [AbstractControl] items of a form by their name.
class FormIndexer extends MapBase<String, AbstractControl> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  Map<String, AbstractControl> _map = {};

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  AbstractControl operator [](Object key) => this._map[key];

  @override
  void operator []=(String key, AbstractControl value) =>
      this._map[key] = value;

  /// [clear] clears the list of form elements.
  @override
  void clear() => this._map.clear();

  /// [keys] provides the full list of indexer keys.
  @override
  Iterable<String> get keys => this._map.keys;

  /// [remove] removes a form element from the indexer.
  @override
  AbstractControl remove(Object key) => this._map.remove(key);

  /// [addControl] adds a form element into the indexer.
  void addControl(AbstractControl control) =>
      this._map[control.uniqueName] = control;

  /// [remove] removes a form element from the indexer.
  void removeControl(AbstractControl control) =>
      this.remove(control.uniqueName);

  /// [getFormGroupByFormPath] provides a FormGroup using by its name.
  FormGroup getFormGroupByFormPath(String formPath) =>
      this._getControlByFormPath<FormGroup>(formPath);

  /// [getFormArrayByFormPath] provides a FormArray using by its name.
  FormArray getFormArrayByFormPath(String formPath) =>
      this._getControlByFormPath<FormArray>(formPath);

  /// [getFormControlByFormPath] provides a FormControl using by its name.
  FormControl<TProperty> getFormControlByFormPath<TProperty>(String formPath) =>
      this._getControlByFormPath<FormControl<TProperty>>(formPath);

  /* Protected methods */

  /* Private methods */
  TAbstractControl
      _getControlByFormPath<TAbstractControl extends AbstractControl>(
          String formPath) {
    TAbstractControl currentClone = Collection(this.values.toList())
        .where((arg1) => arg1 is TAbstractControl)
        .select((arg1) => arg1 as TAbstractControl)
        .where((arg1) => arg1.formPath == formPath)
        .singleOrDefault();

    if (currentClone == null) throw new Exception('Cannot get current clone.');

    return currentClone;
  }
}
