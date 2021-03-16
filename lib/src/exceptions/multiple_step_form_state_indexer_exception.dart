import 'package:flutter_forms/src/exceptions/index.dart';

class MultipleStepFormStateIndexerException implements IException {
  MultipleStepFormStateIndexerException(this.message);

  @override
  String message;
}
