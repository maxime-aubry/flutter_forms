import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [NbValues] is a validator that checks if a array value has a valid length.
class NbValues extends FormControlValidatorAnnotation<List> {
  /* Public properties */
  /// [min] is minimal quantity of items.
  final int min;

  /// [max] is maximal quantity of items.
  final int max;

  /// [remoteMin] is the name of targeted property that user uses to provide minimal quantity of items of your array. This one has priority on [min] value.
  final String remoteMin;

  /// [remoteMax] is the name of targeted property that user uses to provide maximal quantity of items of your array. This one has priority on [max] value.
  final String remoteMax;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const NbValues({
    this.min,
    this.max,
    this.remoteMin,
    this.remoteMax,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's array value has a valid length. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [List] type here.
  @override
  Future<bool> isValid(FormControl<List> control) async {
    int min = super.getRemoteValidatorParameter<int>(
      defaultValue: this.min,
      localParameterName: 'min',
      remoteParameterName: this.remoteMin,
      formGroup: control.parent,
    );
    int max = super.getRemoteValidatorParameter<int>(
      defaultValue: this.max,
      localParameterName: 'max',
      remoteParameterName: this.remoteMax,
      formGroup: control.parent,
    );

    this._validateParameters(min, max);
    bool isValid = this._validate(control.value, min, max);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters(int min, int max) {
    if (min == null)
      throw new ValidatorParameterException('min is not defined.');

    if (max == null)
      throw new ValidatorParameterException('max is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidatorParameterException(
          'min value is greater than max value.');
  }

  bool _validate(List value, int min, int max) {
    if (value == null) return true;
    int comparison_of_min = value.length.compareTo(min);
    int comparison_of_max = value.length.compareTo(max);
    bool isValid = (comparison_of_min >= 0 && comparison_of_max <= 0);
    return isValid;
  }
}
