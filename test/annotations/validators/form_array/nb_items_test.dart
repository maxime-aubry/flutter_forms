import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group('Annotations > Validators > FormArray > NbItems.', () {
    group('Valid.', () {
      test('FormArray items size is equal to min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });

      test('FormArray items size is equal to max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });

      test('FormArray items size is between min and max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormArray items is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: null,
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });

      test('FormArray items size is smaller than min.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });

      test('FormArray items size is greater than max.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: 3, error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });
    });

    group('Remote parameters.', () {
      test('remoteMin is provided. Its value override the one of min.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
            'min': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator =
            NbItems(min: 2, max: 3, remoteMin: 'min', error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });

      test('remoteMax is provided. Its value override the one of max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
                new FormGroup(controls: {}, validators: []),
              ],
              validators: [],
            ),
            'max': new FormControl<int>(value: 4, validators: []),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator =
            NbItems(min: 1, max: 3, remoteMax: 'max', error: null);
        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });
    });

    group('Throws exception on parameters.', () {
      test(
          'Validator throws an exception because min is not provided, using by min and remoteMin.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: null, max: 3, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formArray);
        }, 'Min is not defined.');
      });

      test(
          'Validator throws an exception because max is not provided, using by max and remoteMax.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 1, max: null, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formArray);
        }, 'Max is not defined.');
      });

      test('Validator throws an exception because min is greater than max.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [],
              validators: [],
            ),
          },
          validators: [],
        );
        fakeInitializeRoot(root);

        FormArray formArray = root.controls['child'] as FormArray;
        NbItems validator = NbItems(min: 3, max: 1, error: null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formArray);
        }, 'NbItems validator does not accept that min value is greater than max value.');
      });
    });
  });
}
