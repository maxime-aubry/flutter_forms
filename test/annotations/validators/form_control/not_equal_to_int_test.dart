import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > NotEqualToInt.',
      () {
    group('Valid.', () {
      test('value is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: 31,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 1);
        expect(validator.valueToCompare, 31);
      });

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
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: 1,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 31);
        expect(validator.valueToCompare, 1);
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
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, null);
        expect(validator.valueToCompare, null);
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
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: 1,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, null);
        expect(validator.valueToCompare, 1);
      });

      test('valueToCompare is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(
              value: 1,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 1);
        expect(validator.valueToCompare, isNull);
      });
    });

    group('Invalid.', () {
      test('value is equal to valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(
              value: 1,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: 1,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 1);
        expect(validator.valueToCompare, 1);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(
              value: 1,
              validators: [],
            ),
            'valueToCompare': new FormControl<int>(
              value: 2,
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
        NotEqualToInt validator = NotEqualToInt(
          valueToCompare: 1,
          remoteValueToCompare: 'valueToCompare',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 1);
        expect(valueToCompare.value, 2);
        expect(validator.valueToCompare, 1);
      });
    });
  });
}
