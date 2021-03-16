import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/form/index.dart';

/// [FormValidatorAnnotation] is the parent class for every validators you will create and use.
/// {@category Metadata}
/// {@subCategory Form validators}
abstract class FormValidatorAnnotation<TAbstractControl extends AbstractControl>
    with FormValidatorNavigator {
  /* Public properties */
  /// [serviceName] allows to use a service to load data.
  final String serviceName;

  /// [error] is the error to display.
  final String error;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const FormValidatorAnnotation({
    this.serviceName,
    @required this.error,
  });

  /* Public methods */
  Future<bool> isValid(TAbstractControl control);

  /* Protected methods */

  /* Private methods */
}
