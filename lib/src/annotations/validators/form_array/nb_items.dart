import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [NbItems] is a validator that checks if a FormArray has a valid length.
/// {@category Metadata}
/// {@subCategory Form validators}
class NbItems extends FormArrayValidatorAnnotation {
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
  const NbItems({
    this.min,
    this.max,
    this.remoteMin,
    this.remoteMax,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormArray has a valid length. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormArray].
  @override
  Future<bool> isValid(FormArray control) async {
    int min = super.getRemoteValidatorParameter(
      defaultValue: this.min,
      localParameterName: 'min',
      remoteParameterName: this.remoteMin,
      formGroup: control.parent,
    );
    int max = super.getRemoteValidatorParameter(
      defaultValue: this.max,
      localParameterName: 'max',
      remoteParameterName: this.remoteMax,
      formGroup: control.parent,
    );
    this._validateParameters(min, max);
    bool isValid = this._validate(control.groups.length, min, max);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters(int min, int max) {
    if (min == null)
      throw new ValidatorParameterException('Min is not defined.');

    if (max == null)
      throw new ValidatorParameterException('Max is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidatorParameterException(
          'NbItems validator does not accept that min value is greater than max value.');
  }

  bool _validate(int quantity, int min, int max) =>
      (quantity >= min && quantity <= max);
}
