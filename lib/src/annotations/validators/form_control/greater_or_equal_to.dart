import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/annotations/validators/form_control/index.dart';
import 'package:flutter_forms/src/form/reactive_form/index.dart';

/// [_GreaterOrEqualTo] with [TProperty] generic type is a validator that checks if a value is greater or equal to another.
class _GreaterOrEqualTo<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  /* Public properties */
  /// [valueToCompare] is default value to compare. It's a constant, provided by developer inside the [_GreaterOrEqualTo] annotation.
  final TProperty valueToCompare;

  /// [remoteValueToCompare] is a name of [FormControl] that provides an overriding value of [valueToCompare].
  final String remoteValueToCompare;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const _GreaterOrEqualTo({
    this.valueToCompare,
    this.remoteValueToCompare,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value is greater or equal to another. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] type here, with [TProperty] generic type.
  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty valueToCompare = super.getRemoteValidatorParameter<TProperty>(
      defaultValue: this.valueToCompare,
      localParameterName: 'valueToCompare',
      remoteParameterName: this.remoteValueToCompare,
      formGroup: control.parent,
    );
    bool isValid = this._validate(control.value, valueToCompare);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  bool _validate(TProperty value, TProperty valueToCompare) {
    if (value == null || valueToCompare == null) return true;
    int comparison = value.compareTo(valueToCompare);
    bool isValid = (comparison >= 0);
    return isValid;
  }
}

/// [GreaterOrEqualToDateTime] is a validator that checks if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDateTime extends _GreaterOrEqualTo<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToDateTime({
    DateTime valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToDouble] is a validator that checks if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToDouble extends _GreaterOrEqualTo<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToDouble({
    double valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToInt] is a validator that checks if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToInt extends _GreaterOrEqualTo<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToInt({
    int valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [GreaterOrEqualToNumber] is a validator that checks if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToNumber extends _GreaterOrEqualTo<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToNumber({
    num valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

/* Public methods */

/* Protected methods */

/* Private methods */
}

/// [GreaterOrEqualToString] is a validator that checks if a [DateTime] value is greater or equal to another.
class GreaterOrEqualToString extends _GreaterOrEqualTo<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const GreaterOrEqualToString({
    String valueToCompare,
    String remoteValueToCompare,
    @required String error,
  }) : super(
          valueToCompare: valueToCompare,
          remoteValueToCompare: remoteValueToCompare,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}
