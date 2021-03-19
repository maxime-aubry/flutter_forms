import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [Required] is a validator that checks if a value is provided or not.
class Required extends FormValidatorAnnotation<AbstractControl> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const Required({
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Check if [AbstractControl] is provided or not.
  /// Accepted [AbstractControl] are [FormGroup], [FormArray] and [FormControl].
  ///
  /// If control is a [FormGroup], check if 'controls' variable length is greater than 0. If it is, returns [True], else returns [False].
  /// If control is a [FormArray], check if 'groups' variable length is grater than 0. If it is, returns [True], else returns [False].
  /// If control is a [FormControl] :
  ///   - if it's null, returns [False].
  ///   - if it's a [String] and it's an empty [String], returns [False].
  ///   - else, returns [True];
  @override
  Future<bool> isValid(AbstractControl control) async {
    if (control is FormGroup) return this._validateFormGroup(control);
    if (control is FormArray) return this._validateFormArray(control);
    if (control is FormControl) return this._validateFormControl(control);
    return false;
  }

  /* Protected methods */

  /* Private methods */
  bool _validateFormGroup(FormGroup formGroup) =>
      (formGroup.controls.length > 0);

  bool _validateFormArray(FormArray formArray) => (formArray.groups.length > 0);

  bool _validateFormControl(FormControl formControl) {
    if (formControl.value == null) return false;
    if (formControl.value is String && formControl.value.isEmpty) return false;
    return true;
  }
}
