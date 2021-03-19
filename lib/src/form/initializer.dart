import 'package:flutter/foundation.dart';
import 'package:flutter_forms/src/exceptions/index.dart';

/// [LibraryInitializer] initializes the library, declares the library name that contains contents (models, enums...).
class LibraryInitializer {
  static bool _isInitialized = false;
  static String _libraryName;

  static get isInitialized => LibraryInitializer._isInitialized;
  static get libraryName => LibraryInitializer._libraryName;

  /// [initialize] initializes the library, declares the library name that contains contents (models, enums...).
  static void initialize({
    @required String libraryName,
  }) {
    if (libraryName == null || libraryName.isEmpty)
      throw new LibraryInitializerException(
          'Library name is required for the library initializer. This one provides a way to detect and allow enums.');

    _libraryName = libraryName;
    _isInitialized = true;
  }
}
