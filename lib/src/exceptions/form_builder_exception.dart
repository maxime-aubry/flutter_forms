import 'package:flutter_forms/src/exceptions/index.dart';

class FormBuilderException implements IException {
  FormBuilderException(this.message);

  @override
  String message;
}
