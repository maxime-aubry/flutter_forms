import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [InText] is a validator that checks if the text is contained into another text.
class InText extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  /// [text] is the text in which user will search keywords.
  final String text;

  /// [remoteText] is the name of targeted property in which user will search keywords. This one has priority on [text] value.
  final String remoteText;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const InText({
    this.text,
    this.remoteText,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value is contained into antoher text. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async {
    String text = super.getRemoteValidatorParameter<String>(
      defaultValue: this.text,
      localParameterName: 'text',
      remoteParameterName: this.remoteText,
      formGroup: control.parent,
    );
    bool isValid = this._validate(control.value, text);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  bool _validate(String value, String text) {
    if (value == null || text == null) return true;
    return text.contains(value);
  }
}
