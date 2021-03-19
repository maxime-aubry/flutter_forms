import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/form/index.dart';

/// [FormArrayValidatorAnnotation] is a sub-class of [FormValidatorAnnotation] class for every validators you will create and use, linked to a [FormArray].
/// {@category Metadata}
abstract class FormArrayValidatorAnnotation
    extends FormValidatorAnnotation<FormArray> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const FormArrayValidatorAnnotation({
    String serviceName,
    @required String error,
  }) : super(serviceName: serviceName, error: error);

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}
