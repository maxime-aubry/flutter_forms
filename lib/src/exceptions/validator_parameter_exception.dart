import 'package:flutter_forms/src/exceptions/index.dart';

class ValidatorParameterException implements IException {
  ValidatorParameterException(this.message);

  @override
  String message;
}
