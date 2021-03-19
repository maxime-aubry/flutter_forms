import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/form/index.dart';

/// [FormControlValidatorAnnotation] is a sub-class of [FormValidatorAnnotation] class for every validators you will create and use, linked to a [FormControl].
abstract class FormControlValidatorAnnotation<TProperty>
    extends FormValidatorAnnotation<FormControl<TProperty>> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const FormControlValidatorAnnotation({
    String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}
