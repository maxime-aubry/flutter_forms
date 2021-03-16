import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_forms/src/annotations/validators/form_control/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [FileSize] is a validator that checks if a file has an allowed size.
/// {@category Metadata}
/// {@subCategory Form validators}
class FileSize extends FormControlValidatorAnnotation<Uint8List> {
  /* Public properties */
  /// [size] is the allowed size. It's a constant, provided by developer inside the [FileSize] annotation.
  final int size;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const FileSize({
    @required this.size,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's file has an allowed mime type. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [Uint8List] type here.
  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.size == null)
      throw new ValidatorParameterException('File size is not defined.');
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    if (value.length <= this.size) return true;
    return false;
  }
}
