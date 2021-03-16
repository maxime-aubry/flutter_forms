import 'package:flutter_forms/src/exceptions/index.dart';

class ValidatorNavigationException implements IException {
  ValidatorNavigationException(this.message);

  @override
  String message;
}
