import 'package:flutter_forms/src/exceptions/index.dart';

class FormControlFilterException implements IException {
  FormControlFilterException(this.message);

  @override
  String message;
}
