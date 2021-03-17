import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > RangeOfNumber.',
      () {
    group('Valid.', () {
      test('value is equal to min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });

      test('value is equal to max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 31,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 31);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });

      test('value is between min and max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 15,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 15);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });
    });

    group('Invalid.', () {
      test('value is smaller than min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: -1,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, -1);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });

      test('value is greater than max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 32,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: 31, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 32);
        expect(validator.min, 0);
        expect(validator.max, 31);
      });
    });

    group('Remote parameters.', () {
      test('Remote min is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
            'min': new FormControl<num>(
              value: 0,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        FormControl<num> min = root.controls['min'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(
          min: 15,
          max: 31,
          remoteMin: 'min',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(min.value, 0);
        expect(validator.min, 15);
        expect(validator.max, 31);
      });

      test('Remote max is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
            'max': new FormControl<num>(
              value: 31,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        FormControl<num> max = root.controls['max'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(
          min: 0,
          max: 15,
          remoteMax: 'max',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(max.value, 31);
        expect(validator.min, 0);
        expect(validator.max, 15);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when min is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator =
            RangeOfNumber(min: null, max: 31, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when max is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 0, max: null, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'max is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when min is greater than max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<num>(
              value: 0,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<num> formControl =
            root.controls['child'] as FormControl<num>;
        RangeOfNumber validator = RangeOfNumber(min: 31, max: 0, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min value is greater than max value.');
      });
    });
  });
}
