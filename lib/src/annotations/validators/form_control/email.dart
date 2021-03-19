import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/annotations/validators/form_control/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [Email] is a validator that checks if a value is a valid email.
class Email extends FormControlValidatorAnnotation<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const Email({
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value is a valid email. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async =>
      this._validate(control.value);

  /* Protected methods */

  /* Private methods */
  bool _validate(String value) {
    if (value == null || value.isEmpty) return true;
    RegExp regExp = new RegExp(Rules.email);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
