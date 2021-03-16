import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';

void main() {
  group('ReactiveFormBuilder.', () {
    test('FormBuilder is initialized.', () {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'control1': new FormGroup(
              controls: {
                'control1_1': new FormControl<String>(
                  value: null,
                  validators: [],
                ),
              },
              validators: [],
            ),
            'control2': new FormArray(
              groups: [
                new FormGroup(
                  controls: {
                    'control2_0_1': new FormControl<String>(
                      value: null,
                      validators: [],
                    ),
                  },
                  validators: [],
                ),
                new FormGroup(
                  controls: {
                    'control2_1_1': new FormControl<String>(
                      value: null,
                      validators: [],
                    ),
                  },
                  validators: [],
                ),
              ],
              validators: [],
            ),
            'control3': new FormControl<String>(
              value: null,
              validators: [],
            ),
          },
          validators: [],
        ),
      );

      ReactiveFormState formState = new ReactiveFormState();
      formBuilder.initialize(formState);

      // form builder
      expect(formBuilder.isInitialized, isTrue);
      expect(formBuilder.formState, isNotNull);
      expect(formBuilder.formState, formState);
      expect(formBuilder.indexer, isNotNull);

      // root
      FormGroup root = formBuilder.group;
      expect(root, isNotNull);
      expect(root.name, 'root');
      expect(root.parent, isNull);
      expect(root.isArrayItem, isFalse);
      expect(root.controls, isNotNull);
      expect(root.controls.length, 3);
      expect(root.error, isNull);
      expect(root.status, EAbstractControlStatus.pure);
      expect(root.isInitialized, isTrue);
      expect(root.formPath, 'root');
      expect(root.modelPath, 'root');

      // root.control1
      FormGroup control1 = root.getFormGroup('control1');
      expect(control1, isNotNull);
      expect(control1.name, 'control1');
      expect(control1.parent, root);
      expect(control1.isArrayItem, isFalse);
      expect(control1.controls, isNotNull);
      expect(control1.controls.length, 1);
      expect(control1.error, isNull);
      expect(control1.status, EAbstractControlStatus.pure);
      expect(control1.isInitialized, isTrue);
      expect(control1.formPath, 'root.controls[\'control1\']');
      expect(control1.modelPath, 'root.control1');

      // root.control1.control1_1
      FormControl<String> control1_1 =
          control1.getFormControl<String>('control1_1');
      expect(control1_1, isNotNull);
      expect(control1_1.name, 'control1_1');
      expect(control1_1.parent, control1);
      expect(control1_1.value, isNull);
      expect(control1_1.error, isNull);
      expect(control1_1.status, EAbstractControlStatus.pure);
      expect(control1_1.isInitialized, isTrue);
      expect(control1_1.formPath,
          'root.controls[\'control1\'].controls[\'control1_1\']');
      expect(control1_1.modelPath, 'root.control1.control1_1');

      // root.control2
      FormArray control2 = root.getFormArray('control2');
      expect(control2, isNotNull);
      expect(control2.name, 'control2');
      expect(control2.parent, root);
      expect(control2.groups, isNotNull);
      expect(control2.groups.length, 2);
      expect(control2.error, isNull);
      expect(control2.status, EAbstractControlStatus.pure);
      expect(control2.isInitialized, isTrue);
      expect(control2.formPath, 'root.controls[\'control2\']');
      expect(control2.modelPath, 'root.control2');

      // root.control2[0]
      {
        FormGroup control2_0 = control2.groups[0];
        expect(control2_0, isNotNull);
        expect(control2_0.name, 'control2[0]');
        expect(control2_0.parent, root);
        expect(control2_0.isArrayItem, isTrue);
        expect(control2_0.controls, isNotNull);
        expect(control2_0.controls.length, 1);
        expect(control2_0.error, isNull);
        expect(control2_0.status, EAbstractControlStatus.pure);
        expect(control2_0.isInitialized, isTrue);
        expect(control2_0.formPath, 'root.controls[\'control2\'].groups[0]');
        expect(control2_0.modelPath, 'root.control2[0]');

        // root.control2[0].control2_1
        FormControl<String> control2_0_1 =
            control2_0.getFormControl<String>('control2_0_1');
        expect(control2_0_1, isNotNull);
        expect(control2_0_1.name, 'control2_0_1');
        expect(control2_0_1.parent, control2_0);
        expect(control2_0_1.value, isNull);
        expect(control2_0_1.error, isNull);
        expect(control2_0_1.status, EAbstractControlStatus.pure);
        expect(control2_0_1.isInitialized, isTrue);
        expect(control2_0_1.formPath,
            'root.controls[\'control2\'].groups[0].controls[\'control2_0_1\']');
        expect(control2_0_1.modelPath, 'root.control2[0].control2_0_1');
      }

      // root.control2[1]
      {
        FormGroup control2_1 = control2.groups[1];
        expect(control2_1, isNotNull);
        expect(control2_1.name, 'control2[1]');
        expect(control2_1.parent, root);
        expect(control2_1.isArrayItem, isTrue);
        expect(control2_1.controls, isNotNull);
        expect(control2_1.controls.length, 1);
        expect(control2_1.error, isNull);
        expect(control2_1.status, EAbstractControlStatus.pure);
        expect(control2_1.isInitialized, isTrue);
        expect(control2_1.formPath, 'root.controls[\'control2\'].groups[1]');
        expect(control2_1.modelPath, 'root.control2[1]');

        // root.control2[0].control2_1
        FormControl<String> control2_1_1 =
            control2_1.getFormControl<String>('control2_1_1');
        expect(control2_1_1, isNotNull);
        expect(control2_1_1.name, 'control2_1_1');
        expect(control2_1_1.parent, control2_1);
        expect(control2_1_1.value, isNull);
        expect(control2_1_1.error, isNull);
        expect(control2_1_1.status, EAbstractControlStatus.pure);
        expect(control2_1_1.isInitialized, isTrue);
        expect(control2_1_1.formPath,
            'root.controls[\'control2\'].groups[1].controls[\'control2_1_1\']');
        expect(control2_1_1.modelPath, 'root.control2[1].control2_1_1');
      }

      // root.control3
      FormControl<String> control3 = root.getFormControl<String>('control3');
      expect(control3, isNotNull);
      expect(control3.name, 'control3');
      expect(control3.parent, root);
      expect(control3.value, isNull);
      expect(control3.error, isNull);
      expect(control3.status, EAbstractControlStatus.pure);
      expect(control3.isInitialized, isTrue);
      expect(control3.formPath, 'root.controls[\'control3\']');
      expect(control3.modelPath, 'root.control3');
    });

    test(
        'Throws an exception of FormBuilderException type when ReactiveFormState is null.',
        () {
      ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'control1': new FormGroup(controls: {
              'control1_1': new FormControl<String>(
                value: null,
                validators: [],
              ),
            }, validators: []),
            'control2': new FormArray(
              groups: [
                new FormGroup(
                  controls: {
                    'control2_0_1': new FormControl<String>(
                      value: null,
                      validators: [],
                    ),
                  },
                  validators: [],
                ),
                new FormGroup(
                  controls: {
                    'control2_1_1': new FormControl<String>(
                      value: null,
                      validators: [],
                    ),
                  },
                  validators: [],
                ),
              ],
              validators: [],
            ),
            'control3': new FormControl<String>(
              value: null,
              validators: [],
            ),
          },
          validators: [],
        ),
      );

      expect_exception<FormBuilderException>(() {
        formBuilder.initialize(null);
      }, 'Cannot initialize ReactiveFormBuilder if ReactiveFormState is not provided.');
    });
  });
}
