import 'package:reflectable/reflectable.dart';

/// @flutterFormsValidator must be declared on each class you want to submit to validation.
///
/// You must declared by writing @flutterFormsValidator of the top of your class.
/// {@category Metadata}
class FlutterFormsValidator extends Reflectable {
  const FlutterFormsValidator()
      : super(
          declarationsCapability,
          instanceInvokeCapability,
          libraryCapability,
          metadataCapability,
          reflectedTypeCapability,
        );
}

const flutterFormsValidator = FlutterFormsValidator();
