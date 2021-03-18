import 'package:flutter/foundation.dart';
import 'package:flutter_forms/flutter_forms.dart';

class _PasswordSettings {
  final int minLength;
  final int maxLength;
  final bool includesLowercaseAlphabeticalCharacters;
  final bool includesUppercaseAlphabeticalCharacters;
  final bool includesNumericalCharacters;
  final bool includesSpecialCharacters;

  _PasswordSettings(
    this.minLength,
    this.maxLength,
    this.includesLowercaseAlphabeticalCharacters,
    this.includesUppercaseAlphabeticalCharacters,
    this.includesNumericalCharacters,
    this.includesSpecialCharacters,
  );
}

abstract class _IPasswordCheckRule {
  String name;

  bool checkRule(String value, _PasswordSettings settings);
}

class _PasswordCheckMinLength implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'minLength';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) =>
      value.length >= settings.minLength;

  /* Protected methods */

  /* Private methods */
}

class _PasswordCheckMaxLength implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'maxLength';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) =>
      value.length <= settings.maxLength;

  /* Protected methods */

  /* Private methods */
}

class _PasswordCheckLowercaseAlphabeticalCharacters
    implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'includesLowercaseAlphabeticalCharacters';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) {
    String expression = r'[a-z]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }

  /* Protected methods */

  /* Private methods */
}

class _PasswordCheckUppercaseAlphabeticalCharacters
    implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'includesUppercaseAlphabeticalCharacters';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) {
    String expression = r'[A-Z]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }

  /* Protected methods */

  /* Private methods */
}

class _PasswordCheckNumericalCharacters implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'includesNumericalCharacters';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) {
    String expression = r'[\d]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }

  /* Protected methods */

  /* Private methods */
}

class _PasswordCheckSpecialCharacters implements _IPasswordCheckRule {
  /* Public properties */
  @override
  String name = 'includesSpecialCharacters';

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  @override
  bool checkRule(String value, _PasswordSettings settings) {
    String expression = r'[@$!%*?&]';
    RegExp regExp = new RegExp(expression);
    if (regExp.hasMatch(value.toString())) return true;
    return false;
  }

  /* Protected methods */

  /* Private methods */
}

/// [MembershipPassword] is a validator that checks if the password has a good format according to the settings.
/// {@category Metadata}
/// {@subCategory Form validators}
class MembershipPassword extends FormControlValidatorAnnotation<String> {
  /* Public properties */
  /// [minLength] is the minimal string length of your password.
  final int minLength;

  /// [maxLength] is the maximal string length of your password.
  final int maxLength;

  /// [includesLowercaseAlphabeticalCharacters] forces to add alphabetical characters to the password.
  final bool includesLowercaseAlphabeticalCharacters;

  /// [includesUppercaseAlphabeticalCharacters] forces to add uppercase characters to the password.
  final bool includesUppercaseAlphabeticalCharacters;

  /// [includesNumericalCharacters] forces to add numerical characters to the password.
  final bool includesNumericalCharacters;

  /// [includesSpecialCharacters] forces to add special characters to the password.
  final bool includesSpecialCharacters;

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */
  const MembershipPassword({
    @required this.minLength,
    @required this.maxLength,
    this.includesLowercaseAlphabeticalCharacters = false,
    this.includesUppercaseAlphabeticalCharacters = false,
    this.includesNumericalCharacters = false,
    this.includesSpecialCharacters = false,
    String error,
  }) : super(error: error);

  /* Public methods */
  /// Returns a Future<bool>. The validator will check if FormControl's value has a good format according to the settings. In this case, validator will return [True], else it will return [False].
  ///
  /// The [control] argument is of [FormControl] of [String] type here.
  @override
  Future<bool> isValid(FormControl<String> control) async {
    this._validateParameters();
    bool isValid = this._validate(control.value);
    return isValid;
  }

  /// [getErrorDetails] provides error details. For each option, specify if it's a success or a failure.
  /// // How to use it ?
  /// '''dart
  /// FormControl<String> formControl; // get it...
  /// MembershipPassword validator = formControl.getValidator<MembershipPassword>();
  /// Map<String, bool> details = validator.getErrorDetails('azerty');
  /// '''
  Map<String, bool> getErrorDetails(String value) {
    try {
      Map<String, bool> details = Map<String, bool>();

      _PasswordSettings settings = new _PasswordSettings(
        this.minLength,
        this.maxLength,
        this.includesLowercaseAlphabeticalCharacters,
        this.includesUppercaseAlphabeticalCharacters,
        this.includesNumericalCharacters,
        this.includesSpecialCharacters,
      );

      for (_IPasswordCheckRule rule in this._getRules())
        details[rule.name] = rule.checkRule(value, settings);

      return details;
    } catch (e) {
      return Map<String, bool>();
    }
  }

  /* Protected methods */

  /* Private methods */
  void _validateParameters() {
    if (this.minLength == null)
      throw new ValidatorParameterException('minLength is not defined.');

    if (this.maxLength == null)
      throw new ValidatorParameterException('maxLength is not defined.');

    if (this.minLength.compareTo(this.maxLength) > 0)
      throw new ValidatorParameterException(
          'minLength value is greater than maxLength value.');

    if (this.includesLowercaseAlphabeticalCharacters == null)
      throw new ValidatorParameterException(
          'includesLowercaseAlphabeticalCharacters is not defined.');

    if (this.includesUppercaseAlphabeticalCharacters == null)
      throw new ValidatorParameterException(
          'includesUppercaseAlphabeticalCharacters is not defined.');

    if (this.includesNumericalCharacters == null)
      throw new ValidatorParameterException(
          'includesNumericalCharacters is not defined.');

    if (this.includesSpecialCharacters == null)
      throw new ValidatorParameterException(
          'includesSpecialCharacters is not defined.');
  }

  bool _validate(String value) {
    if (value == null || value.isEmpty) return true;

    _PasswordSettings settings = new _PasswordSettings(
      this.minLength,
      this.maxLength,
      this.includesLowercaseAlphabeticalCharacters,
      this.includesUppercaseAlphabeticalCharacters,
      this.includesNumericalCharacters,
      this.includesSpecialCharacters,
    );

    for (_IPasswordCheckRule rule in this._getRules()) {
      if (!rule.checkRule(value, settings)) return false;
    }

    return true;
  }

  List<_IPasswordCheckRule> _getRules() {
    List<_IPasswordCheckRule> rules = [];

    rules.add(new _PasswordCheckMinLength());
    rules.add(new _PasswordCheckMaxLength());

    if (this.includesLowercaseAlphabeticalCharacters)
      rules.add(new _PasswordCheckLowercaseAlphabeticalCharacters());

    if (this.includesUppercaseAlphabeticalCharacters)
      rules.add(new _PasswordCheckUppercaseAlphabeticalCharacters());

    if (this.includesNumericalCharacters)
      rules.add(new _PasswordCheckNumericalCharacters());

    if (this.includesSpecialCharacters)
      rules.add(new _PasswordCheckSpecialCharacters());

    return rules;
  }
}
