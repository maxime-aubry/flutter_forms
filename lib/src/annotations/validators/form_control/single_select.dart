import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';

/// [SingleSelect] is a validator that checks if value is an item contained into a list of items.
/// {@category Metadata}
/// {@subCategory Form validators}
class SingleSelect<TProperty>
    extends FormControlValidatorAnnotation<TProperty> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const SingleSelect({
    @required String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  /* Public methods */
  /// Compares [FormControl] value with a list of items.
  ///
  /// Returns a Future<bool>. The validator will check if FormControl's value is an item contained into a list of items. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [TProperty] type here.
  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    Future<List<SelectListItem<TProperty>>> Function() service =
        ListItemsProvider.provide<TProperty>(super.serviceName);
    List<SelectListItem<TProperty>> items = await service();

    this._validateParameters(items);
    bool isValid = this._validate(control.value, items);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters(List<SelectListItem> items) {
    if (items == null || items.isEmpty)
      throw new ValidatorParameterException('items is not defined.');
  }

  bool _validate(
    TProperty value,
    List<SelectListItem<TProperty>> items,
  ) {
    if (value == null) return true;

    List<TProperty> itemValues =
        Collection(items).select((arg1) => arg1.value).toList();

    // is value into the provided list of items ?
    if (itemValues.contains(value)) return true;

    return false;
  }
}
