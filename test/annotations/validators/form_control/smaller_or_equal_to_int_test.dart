import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerOrEqualToInt.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: 31,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, 31);
      });

      test('value is equal valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: 0,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, 0);
      });

      test('value and valueToCompare are null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
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
            'child': new FormControl<int>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: 31,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.valueToCompare, 31);
      });

      test('valueToCompare is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, isNull);
      });
    });

    group('Invalid.', () {
      test('value is greater than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 31, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: 0,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 31);
        expect(validator.valueToCompare, 0);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 15, validators: []),
            'valueToCompare': new FormControl<int>(
              value: 31,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        FormControl<int> valueToCompare =
            root.controls['valueToCompare'] as FormControl<int>;
        SmallerOrEqualToInt validator = SmallerOrEqualToInt(
          valueToCompare: 0,
          remoteValueToCompare: 'valueToCompare',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 15);
        expect(valueToCompare.value, 31);
        expect(validator.valueToCompare, 0);
      });
    });
  });
}
