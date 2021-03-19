import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [RegularExpression] is a validator that checks if a value has a good format according to a regular expression.
class RegularExpression extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  /// [expression] is the regular expression to use.
  final String expression;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RegularExpression({
    @required this.expression,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value has a good format accorging to a regular expression. In this case, validator will return [True], else it will return [False].
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
    if (this.expression == null || this.expression.isEmpty)
      throw new ValidatorParameterException(
          'Regular expression is not defined.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(this.expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }
}
