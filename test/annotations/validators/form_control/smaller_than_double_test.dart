import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > SmallerThanDouble.',
      () {
    group('Valid.', () {
      test('valueToCompare is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<double>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
          valueToCompare: 31,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, 31);
      });

      test('value and valueToCompare are null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<double>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
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
            'child': new FormControl<double>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
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
            'child': new FormControl<double>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
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
            'child': new FormControl<double>(value: 31, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
          valueToCompare: 0,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 31);
        expect(validator.valueToCompare, 0);
      });

      test('value is equal valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<double>(value: 0, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
          valueToCompare: 0,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 0);
        expect(validator.valueToCompare, 0);
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<double>(value: 15, validators: []),
            'valueToCompare': new FormControl<double>(
              value: 31,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<double> formControl =
            root.controls['child'] as FormControl<double>;
        FormControl<double> valueToCompare =
            root.controls['valueToCompare'] as FormControl<double>;
        SmallerThanDouble validator = SmallerThanDouble(
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
