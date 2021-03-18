import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  File file;

  setUp(() {
    file = new File('${Directory.current.path}/test/assets/glycine.jpg');
  });

  group('Annotations > Validators > FormControl<TProperty> > ImageSize.', () {
    group('Valid.', () {
      test('Image has allowed size.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 500,
          maxHeight: 600,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);
      });

      test('Image has allowed size with minWidth constraint.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: null,
          minHeight: null,
          maxHeight: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, isNull);
        expect(validator.minHeight, isNull);
        expect(validator.maxHeight, isNull);
      });

      test('Image has allowed size with minHeight constraint.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: null,
          maxWidth: null,
          minHeight: 500,
          maxHeight: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, isNull);
        expect(validator.maxWidth, isNull);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, isNull);
      });

      test('Image has allowed size with maxWidth constraint.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: null,
          maxWidth: 900,
          minHeight: null,
          maxHeight: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, isNull);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, isNull);
        expect(validator.maxHeight, isNull);
      });

      test('Image has allowed size with maxHeight constraint.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: null,
          maxWidth: null,
          minHeight: null,
          maxHeight: 600,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, isNull);
        expect(validator.maxWidth, isNull);
        expect(validator.minHeight, isNull);
        expect(validator.maxHeight, 600);
      });

      test('File is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 500,
          maxHeight: 600,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);
      });
    });

    group('Invalid.', () {
      test('Image width is not allowed.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: 850,
          maxWidth: 900,
          minHeight: 500,
          maxHeight: 600,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 850);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);
      });

      test('Image height is not allowed.', () async {
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
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 550,
          maxHeight: 600,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 550);
        expect(validator.maxHeight, 600);
      });
    });

    group('Remote parameters.', () {
      test('Remote parameters are provided.', () async {
        file = new File('${Directory.current.path}/test/assets/arbre.jpg');

        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<Uint8List>(
              value: file?.readAsBytesSync(),
              validators: [],
            ),
            'minWidth': FormControl<int>(value: 50, validators: []),
            'maxWidth': FormControl<int>(value: 150, validators: []),
            'minHeight': FormControl<int>(value: 50, validators: []),
            'maxHeight': FormControl<int>(value: 150, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<Uint8List> formControl =
            root.controls['child'] as FormControl<Uint8List>;
        FormControl<int> minWidth =
            root.controls['minWidth'] as FormControl<int>;
        FormControl<int> maxWidth =
            root.controls['maxWidth'] as FormControl<int>;
        FormControl<int> minHeight =
            root.controls['minHeight'] as FormControl<int>;
        FormControl<int> maxHeight =
            root.controls['maxHeight'] as FormControl<int>;
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 500,
          maxHeight: 600,
          remoteMinWidth: 'minWidth',
          remoteMaxWidth: 'maxWidth',
          remoteMinHeight: 'minHeight',
          remoteMaxHeight: 'maxHeight',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, file?.readAsBytesSync());
        expect(minWidth.value, 50);
        expect(maxWidth.value, 150);
        expect(minHeight.value, 50);
        expect(maxHeight.value, 150);
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);
        expect(validator.remoteMinWidth, 'minWidth');
        expect(validator.remoteMaxWidth, 'maxWidth');
        expect(validator.remoteMinHeight, 'minHeight');
        expect(validator.remoteMaxHeight, 'maxHeight');
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when no setting has been defined.',
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
        ImageSize validator = ImageSize(
          minWidth: null,
          maxWidth: null,
          minHeight: null,
          maxHeight: null,
          error: null,
        );

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, isNull);
        expect(validator.maxWidth, isNull);
        expect(validator.minHeight, isNull);
        expect(validator.maxHeight, isNull);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'No setting has been defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minWidth is greater than maxWidth.',
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
        ImageSize validator = ImageSize(
          minWidth: 900,
          maxWidth: 800,
          minHeight: 500,
          maxHeight: 600,
          error: null,
        );

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 900);
        expect(validator.maxWidth, 800);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'minWidth value is greater than maxWidth value.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minHeight is greater than maxHeight.',
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
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 600,
          maxHeight: 500,
          error: null,
        );

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 600);
        expect(validator.maxHeight, 500);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'minHeight value is greater than maxHeight value.');
      });

      test(
          'Throws an exception of ValidationException type when current file is not an image.',
          () async {
        file =
            new File('${Directory.current.path}/test/assets/image.base64.txt');

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
        ImageSize validator = ImageSize(
          minWidth: 800,
          maxWidth: 900,
          minHeight: 500,
          maxHeight: 600,
          error: null,
        );

        expect(formControl.value, file?.readAsBytesSync());
        expect(validator.minWidth, 800);
        expect(validator.maxWidth, 900);
        expect(validator.minHeight, 500);
        expect(validator.maxHeight, 600);

        expect_exception<ValidationException>(() async {
          await validator.isValid(formControl);
        }, 'current file is not an image.');
      });
    });
  });
}
