import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > RangeOfDateTime.',
      () {
    group('Valid.', () {
      test('value is equal to min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });

      test('value is equal to max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 31),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 31));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });

      test('value is between min and max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 15),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 15));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });
    });

    group('Invalid.', () {
      test('value is smaller than min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2020, 12, 31),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, new DateTime(2020, 12, 31));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });

      test('value is greater than max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 2, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, new DateTime(2021, 2, 1));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });
    });

    group('Remote parameters.', () {
      test('Remote min is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
            'min': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        FormControl<DateTime> min =
            root.controls['min'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-15T00:00:00'),
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          remoteMin: 'min',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(min.value, new DateTime(2021, 1, 1));
        expect(validator.min, const ConstantDateTime('2021-01-15T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-31T00:00:00'));
      });

      test('Remote max is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
            'max': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 31),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        FormControl<DateTime> max =
            root.controls['max'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: const ConstantDateTime('2021-01-15T00:00:00'),
          remoteMax: 'max',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(max.value, new DateTime(2021, 1, 31));
        expect(validator.min, const ConstantDateTime('2021-01-01T00:00:00'));
        expect(validator.max, const ConstantDateTime('2021-01-15T00:00:00'));
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when min is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: null,
          max: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when max is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-01T00:00:00'),
          max: null,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'max is not defined.');
      });

      test(
          'Throws exception of ValidatorParameterException type when min is greater than max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        RangeOfDateTime validator = RangeOfDateTime(
          min: const ConstantDateTime('2021-01-31T00:00:00'),
          max: const ConstantDateTime('2021-01-01T00:00:00'),
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min value is greater than max value.');
      });
    });
  });
}
