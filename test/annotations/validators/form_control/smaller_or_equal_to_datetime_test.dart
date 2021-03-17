import 'package:constant_datetime/constant_datetime.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToDateTime.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(
          validator.valueToCompare,
          const ConstantDateTime('2021-01-31T00:00:00'),
        );
      });

      test('value is equal valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(
          validator.valueToCompare,
          const ConstantDateTime('2021-01-01T00:00:00'),
        );
      });

      test('value and valueToCompare are null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.valueToCompare, isNull);
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: const ConstantDateTime('2021-01-31T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(
          validator.valueToCompare,
          const ConstantDateTime('2021-01-31T00:00:00'),
        );
      });

      test('valueToCompare is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 1),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 1));
        expect(validator.valueToCompare, isNull);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 31),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, new DateTime(2021, 1, 31));
        expect(
          validator.valueToCompare,
          const ConstantDateTime('2021-01-01T00:00:00'),
        );
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 15),
              validators: [],
            ),
            'valueToCompare': new FormControl<DateTime>(
              value: new DateTime(2021, 1, 31),
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<DateTime> formControl =
            root.controls['child'] as FormControl<DateTime>;
        FormControl<DateTime> valueToCompare =
            root.controls['valueToCompare'] as FormControl<DateTime>;
        SmallerOrEqualToDateTime validator = SmallerOrEqualToDateTime(
          valueToCompare: const ConstantDateTime('2021-01-01T00:00:00'),
          remoteValueToCompare: 'valueToCompare',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, new DateTime(2021, 1, 15));
        expect(valueToCompare.value, new DateTime(2021, 1, 31));
        expect(
          validator.valueToCompare,
          const ConstantDateTime('2021-01-01T00:00:00'),
        );
      });
    });
  });
}
