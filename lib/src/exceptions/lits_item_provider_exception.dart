import 'package:flutter_forms/src/exceptions/index.dart';

class ListItemProviderException implements IException {
  ListItemProviderException(this.message);

  @override
  String message;
}
