import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

/// [_Range] with [TProperty] generic type is a validator that checks if a value is between min and max values.
class _Range<TProperty extends Comparable>
    extends FormControlValidatorAnnotation<TProperty> {
  /* Public properties */
  /// [min] is the minimal value of your range.
  final TProperty min;

  /// [max] is the maximal value of your range.
  final TProperty max;

  /// [remoteMin] is the name of targeted property that user uses to provide minimal value of your range. This one has priority on [min] value.
  final String remoteMin;

  /// [remoteMax] is the name of targeted property that user uses to provide maximal value of your range. This one has priority on [max] value.
  final String remoteMax;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const _Range({
    this.min,
    this.max,
    this.remoteMin,
    this.remoteMax,
    @required String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value is is between [min] and [max] values. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] type here, with [TProperty] generic type.
  @override
  Future<bool> isValid(FormControl<TProperty> control) async {
    TProperty min = super.getRemoteValidatorParameter(
      defaultValue: this.min,
      localParameterName: 'min',
      remoteParameterName: this.remoteMin,
      formGroup: control.parent,
    );
    TProperty max = super.getRemoteValidatorParameter(
      defaultValue: this.max,
      localParameterName: 'max',
      remoteParameterName: this.remoteMax,
      formGroup: control.parent,
    );

    this._validateParameters(min, max);
    bool isValid = this._validate(control.value, min, max);
    return isValid;
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters(TProperty min, TProperty max) {
    if (min == null)
      throw new ValidatorParameterException('min is not defined.');

    if (max == null)
      throw new ValidatorParameterException('max is not defined.');

    if (min.compareTo(max) > 0)
      throw new ValidatorParameterException(
          'min value is greater than max value.');
  }

  bool _validate(
    TProperty value,
    TProperty min,
    TProperty max,
  ) {
    if (value == null) return true;
    int comparison_of_min = value.compareTo(min);
    int comparison_of_max = value.compareTo(max);
    bool isValid = (comparison_of_min >= 0 && comparison_of_max <= 0);
    return isValid;
  }
}

/// [RangeOfDateTime] is a validator that checks if a [DateTime] value is between [min] and [max] values.
class RangeOfDateTime extends _Range<DateTime> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RangeOfDateTime({
    DateTime min,
    DateTime max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [RangeOfDouble] is a validator that checks if a [double] value is between [min] and [max] values.
class RangeOfDouble extends _Range<double> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RangeOfDouble({
    double min,
    double max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [RangeOfInt] is a validator that checks if a [int] value is between [min] and [max] values.
class RangeOfInt extends _Range<int> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RangeOfInt({
    int min,
    int max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}

/// [RangeOfNumber] is a validator that checks if a [num] value is between [min] and [max] values.
class RangeOfNumber extends _Range<num> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RangeOfNumber({
    num min,
    num max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );

/* Public methods */

/* Protected methods */

/* Private methods */
}

/// [RangeOfString] is a validator that checks if a [String] value is between [min] and [max] values.
class RangeOfString extends _Range<String> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const RangeOfString({
    String min,
    String max,
    String remoteMin,
    String remoteMax,
    @required String error,
  }) : super(
          min: min,
          max: max,
          remoteMin: remoteMin,
          remoteMax: remoteMax,
          error: error,
        );

  /* Public methods */

  /* Protected methods */

  /* Private methods */
}
