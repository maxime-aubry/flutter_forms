import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NbValues.', () {
    group('Valid.', () {
      test('Number of values is equal to min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a'],
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, ['a']);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });

      test('Number of values is equal to max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a', 'b', 'c'],
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, ['a', 'b', 'c']);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });

      test('Number of values is between min and max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a', 'b'],
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, ['a', 'b']);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });
    });

    group('Invalid.', () {
      test('Number of values is smaller than min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: [],
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, []);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });

      test('Number of values is greater than max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a', 'b', 'c', 'd'],
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: 3, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, ['a', 'b', 'c', 'd']);
        expect(validator.min, 1);
        expect(validator.max, 3);
      });
    });

    group('Remote parameters.', () {
      test('remoteMin is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a'],
              validators: [],
            ),
            'min': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        FormControl<int> min = root.controls['min'] as FormControl<int>;
        NbValues validator = NbValues(
          min: 2,
          max: 3,
          remoteMin: 'min',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, ['a']);
        expect(min.value, 1);
        expect(validator.min, 2);
        expect(validator.max, 3);
      });

      test('remoteMax is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(
              value: ['a', 'b', 'c'],
              validators: [],
            ),
            'max': new FormControl<int>(value: 3, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        FormControl<int> max = root.controls['max'] as FormControl<int>;
        NbValues validator = NbValues(
          min: 1,
          max: 2,
          remoteMax: 'max',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, ['a', 'b', 'c']);
        expect(max.value, 3);
        expect(validator.min, 1);
        expect(validator.max, 2);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when min is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: null, max: 3, error: null);

        expect(validator.min, null);
        expect(validator.max, 3);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when max is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 1, max: null, error: null);

        expect(validator.min, 1);
        expect(validator.max, null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'max is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when min is greater than max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<List<String>>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<List<String>> formControl =
            root.controls['child'] as FormControl<List<String>>;
        NbValues validator = NbValues(min: 3, max: 1, error: null);

        expect(validator.min, 3);
        expect(validator.max, 1);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min value is greater than max value.');
      });
    });
  });
}
