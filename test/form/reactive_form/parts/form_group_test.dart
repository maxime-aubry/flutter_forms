import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../models/models.reflectable.dart';
import 'initializer/initializer.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Form > ReactiveForm > Parts > FormGroup.', () {
    group('Getters.', () {
      test('Root getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<int>(value: 1, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<int> child = root.controls['child'] as FormControl<int>;
        expect(root, child.root);
      });

      test('FormPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormGroup child = root.controls['child'] as FormGroup;
        expect(child.formPath, 'root.controls[\'child\']');
      });

      test('ModelPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormGroup child = root.controls['child'] as FormGroup;
        expect(child.modelPath, 'root.child');
      });
    });

    group('getValidator.', () {
      test('getValidator returns Required validator.', () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [Required(error: null)],
        );
        initializeRoot(root);

        Required validator = root.getValidator<Required>();
        expect(validator, isNotNull);
      });

      test(
          'getValidator throws an exception of FormBuilderException type when validator is not found.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getValidator<Required>();
        }, 'Current FormGroup has no validator of Required type.');
      });
    });

    group('containsControl.', () {
      test('containsControl find control using by key.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        bool exists = root.containsControl('child');
        expect(exists, isTrue);
      });

      test('containsControl does not find control using by key.', () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        bool exists = root.containsControl('child');
        expect(exists, isFalse);
      });

      test(
          'containsControl throws an exception of FormGroup_FormBuilderException type when name is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.containsControl(null);
        }, 'Cannot check if control does exist if its name is not provided.');
      });

      test(
          'containsControl throws an exception of FormGroup_FormBuilderException type when name is empty.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.containsControl('');
        }, 'Cannot check if control does exist if its name is not provided.');
      });
    });

    group('addControl.', () {
      test('addControl adds a control.', () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);
        FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

        root.addControl('child', controlToAdd);

        bool isRegistered = root.containsControl('child');
        expect(isRegistered, isTrue);
      });

      test(
          'addControl throws an exception of FormBuilderException type when name is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);
        FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

        expect_exception<FormBuilderException>(() async {
          await root.addControl(null, controlToAdd);
        }, 'Cannot add control if its name is not provided.');
      });

      test(
          'addControl throws an exception of FormBuilderException type when name is empty.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);
        FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

        expect_exception<FormBuilderException>(() async {
          await root.addControl(null, controlToAdd);
        }, 'Cannot add control if its name is not provided.');
      });

      test(
          'addControl throws an exception of FormBuilderException type when control is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.addControl('child', null);
        }, 'Cannot add control if this one is null.');
      });

      test(
          'addControl throws an exception of FormBuilderException type when key does already exist.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);
        FormGroup controlToAdd = new FormGroup(controls: {}, validators: []);

        expect_exception<FormBuilderException>(() async {
          await root.addControl('child', controlToAdd);
        }, 'Cannot add control if this one is already added.');
      });
    });

    group('removeControl.', () {
      test('removeControl removes a control.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        root.removeControl('child');
        bool isRegistered = root.containsControl('child');
        expect(isRegistered, isFalse);
      });

      test(
          'removeControl throws an exception of FormBuilderException type when name is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.removeControl(null);
        }, 'Cannot remove control if its name is not provided.');
      });

      test(
          'removeControl throws an exception of FormBuilderException type when name is empty.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.removeControl('');
        }, 'Cannot remove control if its name is not provided.');
      });

      test(
          'removeControl throws an exception of FormBuilderException type when control is not registered.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.removeControl('child');
        }, 'Cannot remove control if this one is not registered.');
      });
    });

    group('getFormGroup.', () {
      test('getFormGroup find a FormGroup.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormGroup(controls: {}, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormGroup formGroup = root.getFormGroup('child');
        expect(formGroup, isNotNull);
      });

      test(
          'getFormGroup throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormGroup('child');
        }, 'FormGroup not found.');
      });

      test(
          'getFormGroup throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormGroup('child');
        }, 'Control is not of FormGroup type.');
      });
    });

    group('getFormArray', () {
      test('getFormArray find a FormArray.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray formArray = root.getFormArray('child');
        expect(formArray, isNotNull);
      });

      test(
          'getFormArray throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormArray('child');
        }, 'FormArray not found.');
      });

      test(
          'getFormArray throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormArray('child');
        }, 'Control is not of FormArray type.');
      });
    });

    group('getFormControl', () {
      test('getFormControl find a FormControl.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl formControl = root.getFormControl<String>('child');
        expect(formControl, isNotNull);
      });

      test(
          'getFormControl throws an exception of FormBuilderException type when control is not found.',
          () {
        FormGroup root = new FormGroup(
          controls: {},
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormControl<String>('child');
        }, 'FormControl not found.');
      });

      test(
          'Throws an exception of FormBuilderException type when key does exist but control has a bad type.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        expect_exception<FormBuilderException>(() async {
          await root.getFormControl<int>('child');
        }, 'Control is not of FormControl<int> type.');
      });
    });
  });
}
