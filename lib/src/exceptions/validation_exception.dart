import 'package:flutter_forms/src/exceptions/index.dart';

class ValidationException implements IException {
  ValidationException(this.message);

  @override
  String message;
}
