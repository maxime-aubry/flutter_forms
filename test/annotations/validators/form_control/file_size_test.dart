import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  File file = new File('${Directory.current.path}/test/assets/glycine.jpg');

  group('Annotations > Validators > FormControl<TProperty> > FileSize.', () {
    group('Valid.', () {
      test('File\'s size is allowed.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileSize validator = FileSize(size: 1048576, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.size, 1048576);
      });

      test('File not provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileSize validator = FileSize(size: 1048576, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.size, 1048576);
      });
    });

    group('Invalid.', () {
      test('File\'s size is not allowed.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileSize validator = FileSize(size: 100000, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.size, 100000);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when file size is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileSize validator = FileSize(size: null, error: null);

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.size, isNull);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'File size is not defined.');
      });
    });
  });
}
