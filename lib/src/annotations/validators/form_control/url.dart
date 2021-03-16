import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

enum EUrlProtocol { http, https, ftp }

/// [Url] is a validator that checks if a value has a good URL format.
/// {@category Metadata}
/// {@subCategory Form validators}
class Url extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  final List<EUrlProtocol> protocols;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const Url({
    @required this.protocols,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value has a good URL format. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = await this._validate(control.value);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.protocols == null || this.protocols.isEmpty)
      throw new ValidatorParameterException('protocols is not defined.');
  }

  bool _validate(String value) {
    if (value == null) return true;
    RegExp regExp = new RegExp(Rules.url(this.protocols));
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
