import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [StringLength] is a validator that checks if a string value is a valid length.
/// {@category Metadata}
/// {@subCategory Form validators}
class StringLength extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  /// [min] is the minimal number of your string length.
  final int min;

  /// [max] is the maximal number of your string length.
  final int max;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const StringLength({
    @required this.min,
    @required this.max,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's string value is a valid length. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = this._validate(control.value);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (min == null)
      throw new ValidatorParameterException('min value is not defined.');

    if (max == null)
      throw new ValidatorParameterException('max value is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidatorParameterException(
          'min value is greater than max value.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    return (value.length >= this.min && value.length <= this.max);
  }
}
