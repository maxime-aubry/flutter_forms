import 'dart:collection';

import 'package:flutter_forms/flutter_forms.dart';

/// [MultipleStepFormStateIndexer] indexes all [ReactiveFormState] items of a form by their name.
///
/// Must be used for forms with multiple steps .
/// {@category Form}
class MultipleStepFormStateIndexer extends MapBase<String, ReactiveFormState> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  Map<String, ReactiveFormState> _map = {};

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  ReactiveFormState operator [](Object key) => this._map[key];

  @override
  void operator []=(String key, ReactiveFormState value) =>
      this._map[key] = value;

  /// [clear] clears the list of ReactiveFormState.
  @override
  void clear() => this._map.clear();

  /// [keys] provides the full list of indexer keys.
  @override
  Iterable<String> get keys => this._map.keys;

  /// [remove] removes a ReactiveFormState from the indexer.
  @override
  ReactiveFormState remove(Object key) => this._map.remove(key);

  /// [addControl] adds a ReactiveFormState into the indexer.
  void addFormState(String step, ReactiveFormState formState) =>
      this._map[step] = formState;

  /// [remove] removes a ReactiveFormState from the indexer.
  void removeFormState(String step) => this.remove(step);

  /// [getFormState] provides a ReactiveFormState using by its name.
  ReactiveFormState getFormState(String step) {
    if (step == null || step.isEmpty)
      throw new MultipleStepFormStateIndexerException(
        'Step name is not provided.',
      );

    if (!this.containsKey(step))
      throw new MultipleStepFormStateIndexerException(
        'Step name is not registered.',
      );

    ReactiveFormState formState = this._map[step];
    return formState;
  }

  /* Protected methods */

  /* Private methods */
}
