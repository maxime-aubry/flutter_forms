import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';

/// [MultiSelect] is a validator that checks if value is a selection of items contained into a list of items.
class MultiSelect<TProperty>
    extends FormControlValidatorAnnotation<List<TProperty>> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const MultiSelect({
    @required String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value is a selection of items contained into a list of items. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [TProperty] type here.
  @override
  Future<bool> isValid(FormControl<List<TProperty>> control) async {
    Future<List<SelectListItem<TProperty>>> Function() service =
        ListItemsProvider.provide<TProperty>(super.serviceName);
    List<SelectListItem<TProperty>> items = await service();

    this._validateParameters(items);
    bool isValid = this._validate(control.value, items);
    return isValid;
  }

  void _validateParameters(List<SelectListItem> items) {
    if (items == null || items.isEmpty)
      throw new ValidatorParameterException('items is not defined.');
  }

  /* Protected methods */

  /* Private methods */
  bool _validate(
    List<TProperty> values,
    List<SelectListItem<TProperty>> items,
  ) {
    if (values == null || values.isEmpty) return true;

    List<TProperty> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();

    // are each value into the provided list of items ?
    IEnumerable<TProperty> unknownValues =
        Collection(values).except(Collection(itemValues));
    if (unknownValues.any()) return false;

    return true;
  }
}
