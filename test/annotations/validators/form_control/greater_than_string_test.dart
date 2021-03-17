import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > GreaterThanString.',
      () {
    group('Valid.', () {
      test('value is greater than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'b', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterThanString validator = GreaterThanString(
          valueToCompare: 'a',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'b');
        expect(validator.valueToCompare, 'a');
      });

      test('value and valueToCompare are null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
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
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
          valueToCompare: 'a',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.valueToCompare, 'a');
      });

      test('valueToCompare is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'b', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
          valueToCompare: null,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'b');
        expect(validator.valueToCompare, isNull);
      });
    });

    group('Invalid.', () {
      test('value is smaller than valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'a', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
          valueToCompare: 'b',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'a');
        expect(validator.valueToCompare, 'b');
      });

      test('valueToCompare is equal to valueToCompare.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'a', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
          valueToCompare: 'a',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'a');
        expect(validator.valueToCompare, 'a');
      });
    });

    group('Remote parameters.', () {
      test('Remote valueToCompare is provided.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'b', validators: []),
            'valueToCompare':
                new FormControl<String>(value: 'a', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        FormControl<String> valueToCompare =
            root.controls['valueToCompare'] as FormControl<String>;
        GreaterOrEqualToString validator = GreaterOrEqualToString(
          valueToCompare: 'b' 'a',
          remoteValueToCompare: 'valueToCompare',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'b');
        expect(valueToCompare.value, 'a');
        expect(validator.valueToCompare, 'b' 'a');
        expect(validator.remoteValueToCompare, 'valueToCompare');
      });
    });
  });
}
