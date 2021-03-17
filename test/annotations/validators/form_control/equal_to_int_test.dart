import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > EqualToInt.', () {
    group('Valid.', () {
      test('value equals valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        EqualToInt validator = EqualToInt(valueToCompare: 0, error: null);

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
        EqualToInt validator = EqualToInt(
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
        EqualToInt validator = EqualToInt(valueToCompare: 0, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.valueToCompare, 0);
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
        EqualToInt validator = EqualToInt(valueToCompare: null, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, null);
      });
    });

    group('Invalid.', () {
      test('value is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        EqualToInt validator = EqualToInt(valueToCompare: 1, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, 1);
      });

      test('value is greater than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        EqualToInt validator = EqualToInt(valueToCompare: 0, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 1);
        expect(validator.valueToCompare, 0);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 1, validators: []),
            'valueToCompare': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> formControl =
            root.controls['child'] as FormControl<int>;
        FormControl<int> valueToCompare =
            root.controls['valueToCompare'] as FormControl<int>;
        EqualToInt validator = EqualToInt(
          valueToCompare: 0,
          remoteValueToCompare: 'valueToCompare',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 1);
        expect(valueToCompare.value, 1);
        expect(validator.valueToCompare, 0);
        expect(validator.remoteValueToCompare, 'valueToCompare');
      });
    });
  });
}
