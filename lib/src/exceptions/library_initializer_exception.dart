import 'package:flutter_forms/src/exceptions/index.dart';

class LibraryInitializerException implements IException {
  LibraryInitializerException(this.message);

  @override
  String message;
}
