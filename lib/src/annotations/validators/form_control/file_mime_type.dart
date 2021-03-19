import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/validators/form_control/index.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';
import 'package:mime/mime.dart';

/// [FileMimeType] is a validator that checks if a file has an allowed mime type.
class FileMimeType extends FormControlValidatorAnnotation<Uint8List> {
  /* Public properties */
  /// [mimeTypes] is the allowed mime types list. It's a constant, provided by developer inside the [FileMimeType] annotation.
  final List<String> mimeTypes;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const FileMimeType({
    @required this.mimeTypes,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's file has an allowed mime type. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [Uint8List] type here.
  @override
  Future<bool> isValid(FormControl<Uint8List> control) async {
    this._validateParameters();
    bool isValid = this._validate(control.value);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.mimeTypes == null || this.mimeTypes.isEmpty)
      throw new ValidatorParameterException('Mime types are not defined.');
  }

  bool _validate(Uint8List value) {
    if (value == null) return true;
    String mimeType = lookupMimeType('no-file', headerBytes: value);
    if (this.mimeTypes.contains(mimeType)) return true;
    return false;
  }
}
