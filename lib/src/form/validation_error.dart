/// [ValidationError] class provides an error report in case of no-validation of the form element.
/// {@category Form}
class ValidationError {
  ValidationError(
    this.propertyName,
    this.validatorType,
    this.message,
  );

  /// [propertyName] is the name of current property to validate.
  final String propertyName;

  /// [validatorType] is the validator type (Required, EqualTo, GreaterThan...)
  final Type validatorType;

  /// [message] is the error to display (provided by developers).
  final String message;

  ValidationError copyWith({
    String propertyName,
    Type validatorType,
    String message,
  }) {
    return ValidationError(
      propertyName ?? this.propertyName,
      validatorType ?? this.validatorType,
      message ?? this.message,
    );
  }
}
