import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  File file = new File('${Directory.current.path}/test/assets/glycine.jpg');

  group('Annotations > Validators > FormControl<TProperty> > FileMimeType.',
      () {
    group('Valid.', () {
      test('File\'s mime type is allowed.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileMimeType validator = FileMimeType(
          mimeTypes: ['image/jpeg'],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.mimeTypes, ['image/jpeg']);
      });

      test('File not provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileMimeType validator = FileMimeType(
          mimeTypes: ['image/jpeg'],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.mimeTypes, ['image/jpeg']);
      });
    });

    group('Invalid.', () {
      test('File\'s mime type is not allowed.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileMimeType validator = FileMimeType(
          mimeTypes: ['image/png'],
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.mimeTypes, ['image/png']);
      });
    });

    group('Remote parameters.', () {});

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when mimeType array is null.',
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
        fakeInitializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileMimeType validator = FileMimeType(mimeTypes: null, error: null);

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.mimeTypes, isNull);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'Mime types are not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when mimeType array is empty.',
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
        fakeInitializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FileMimeType validator = FileMimeType(mimeTypes: [], error: null);

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.mimeTypes, []);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'Mime types are not defined.');
      });
    });
  });
}
