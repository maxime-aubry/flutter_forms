import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/index.dart';

/// [FormValidatorNavigator] is a mixin used to navigate into a form with a validator.
/// {@category Metadata}
/// {@subCategory Form validators}
mixin FormValidatorNavigator {
  /* Public properties */

  /* Protected properties */

  /* Private properties */

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  /// [getRemoteValidatorParameter] is a function used to get remote data.
  /// A default value can be provided by the developer, inside de definition of the validator.
  /// But this one can be overrided by a remote value into the form.
  /// 
  /// If parameter name is not provided, this function will throw an exception.
  /// For DateTime data, you must use a ConstantDateTime for default parameter. If you don't, this function will throw an exception.
  /// 
  /// How to use it :
  /// ```dart
  /// class CustomValidator extends FormControlValidatorAnnotation<String> {
  ///   final int localParameter;
  ///   final String remoteParameterName;
  /// 
  ///   const CustomValidator(
  ///     this.localParameter,
  ///     @required String error,
  ///   ) : super(error: error);
  /// 
  ///   @override
  ///   Future<bool> isValid(FormControl<String> control) async {
  ///     int parameter = super.getRemoteValidatorParameter<int>(
  ///       defaultValue: this.localParameter,
  ///       localParameterName: 'localParameter',
  ///       remoteParameterName: this.remoteParameterName,
  ///       formGroup: control.parent,
  ///     );
  ///
  ///     // ...
  ///   }
  /// }
  /// ```
  TParameter getRemoteValidatorParameter<TParameter>({
    /// [defaultValue] is a constant, provided by developer inside the validator annotation.
    @required TParameter defaultValue,

    /// [localParameterName] is the name of constant that hosts the default value.
    @required String localParameterName,

    /// [remoteParameterName] is a name of [FormControl] that provides an overriding value of [defaultValue].
    @required String remoteParameterName,

    /// The [control] is a [FormGroup].
    /// It's the parent group provided [AbstractControl] for the current validator.
    @required FormGroup formGroup,

    ///// [required] defines if a value is waited or not.
    ///// If nothing is returned, a [ValidatorParameterException] exception will be thrown.
    //bool required = false,
  }) {
    //#region locales methods
    TParameter getCastedDefaultValue() {
      if (defaultValue == null) return null;

      if (TParameter == DateTime) {
        if (defaultValue is! ConstantDateTime) {
          throw new ValidatorParameterException(
            '''Cannot get datetime from remote parameter.
            This one is not a ConstantDateTime object, its type is $TParameter.
            Please, provide a ConstantDateTime object, just like this :
            @Validator(parameter: ConstantDateTime('yyyy-MM-ddTHH:mm:ssZ'))''',
          );
        }
        defaultValue =
            (defaultValue as ConstantDateTime).toDateTime() as TParameter;
      }

      return defaultValue;
    }

    TParameter getRemoteParameter() {
      TParameter remoteParameter =
          formGroup.getFormControl(remoteParameterName)?.value;
      return remoteParameter;
    }

    TParameter getParameter() {
      if (remoteParameterName != null && remoteParameterName.isEmpty)
        throw new ValidatorParameterException(
            'Cannot get remote parameter with an empty parameter name.');

      bool isRemoteParameterDefined = (remoteParameterName != null);

      if (!isRemoteParameterDefined) return defaultValue;

      TParameter parameter = getRemoteParameter();
      return parameter;
    }
    //#endregion

    defaultValue = getCastedDefaultValue();
    TParameter parameter = getParameter();
    return parameter;
  }

  /* Protected methods */

  /* Private methods */
}
