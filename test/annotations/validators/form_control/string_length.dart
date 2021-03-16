import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > StringLength.',
      () {
    group('Valid.', () {
      test('value\'s length is equal to min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abc', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'abc');
        expect(validator.min, 3);
        expect(validator.max, 5);
      });

      test('value\'s length is equal to max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcde', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'abcde');
        expect(validator.min, 3);
        expect(validator.max, 5);
      });

      test('value\'s length is between min and max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcd', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'abcd');
        expect(validator.min, 3);
        expect(validator.max, 5);
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.min, 3);
        expect(validator.max, 5);
      });
    });

    group('Invalid.', () {
      test('value\'s length is smaller than min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'ab', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'ab');
        expect(validator.min, 3);
        expect(validator.max, 5);
      });

      test('value\'s length is greater than max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcdef', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: 5, error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'abcdef');
        expect(validator.min, 3);
        expect(validator.max, 5);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when min is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcdef', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: null, max: 5, error: null);

        expect(formControl.value, 'abcdef');
        expect(validator.min, isNull);
        expect(validator.max, 5);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min value is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when max is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcdef', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 3, max: null, error: null);

        expect(formControl.value, 'abcdef');
        expect(validator.min, 3);
        expect(validator.max, isNull);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'max value is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when min is greater than max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'abcdef', validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        StringLength validator = StringLength(min: 5, max: 3, error: null);

        expect(formControl.value, 'abcdef');
        expect(validator.min, 5);
        expect(validator.max, 3);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'min value is greater than max value.');
      });
    });
  });
}
