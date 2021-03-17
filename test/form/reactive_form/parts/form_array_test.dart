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

  group('Form > ReactiveForm > Parts > FormArray.', () {
    group('Getters.', () {
      test('Root getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        expect(root, child.root);
      });

      test('FormPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        expect(child.formPath, 'root.controls[\'child\']');
      });

      test('ModelPath getter works.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        expect(child.modelPath, 'root.child');
      });
    });

    group('getValidator.', () {
      test('getValidator returns Required validator.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(
              groups: [],
              validators: [Required(error: null)],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        Required validator = child.getValidator<Required>();
        expect(validator, isNotNull);
      });

      test(
          'getValidator throws an exception of FormBuilderException type when validator is not found.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;

        expect_exception<FormBuilderException>(() {
          child.getValidator<Required>();
        }, 'Current FormArray has no validator of Required type.');
      });
    });

    group('addGroup.', () {
      test('addGroup adds items to FormArray.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        FormGroup groupToAdd = new FormGroup(controls: {}, validators: []);

        child.addGroup(groupToAdd, notify: false);
        expect(child.groups.length, 1);
      });

      test(
          'addGroup throws an exception of FormBuilderException type when group is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;

        expect_exception<FormBuilderException>(() async {
          await child.addGroup(null, notify: false);
        }, 'Cannot add FormGroup if this one is null.');
      });
    });

    group('removeGroup.', () {
      test('removeGroup removes first item.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
            ], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        FormGroup groupToRemove = child.groups[0];

        child.removeGroup(groupToRemove, notify: false);
        bool exists = child.groups.contains(groupToRemove);
        expect(exists, isFalse);
        expect(child.groups.length, 2);
        expect(child.groups[0].name, 'child[0]');
        expect(child.groups[1].name, 'child[1]');
      });

      test('removeGroup removes second item.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
            ], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        FormGroup groupToRemove = child.groups[1];

        child.removeGroup(groupToRemove, notify: false);
        bool exists = child.groups.contains(groupToRemove);
        expect(exists, isFalse);
        expect(child.groups.length, 2);
        expect(child.groups[0].name, 'child[0]');
        expect(child.groups[1].name, 'child[1]');
      });

      test('removeGroup removes third item.', () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
            ], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        FormGroup groupToRemove = child.groups[2];

        child.removeGroup(groupToRemove, notify: false);
        bool exists = child.groups.contains(groupToRemove);
        expect(exists, isFalse);
        expect(child.groups.length, 2);
        expect(child.groups[0].name, 'child[0]');
        expect(child.groups[1].name, 'child[1]');
      });

      test(
          'removeGroup throws an exception of FormBuilderException type when group is null.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
              new FormGroup(controls: {}, validators: []),
            ], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;

        expect_exception<FormBuilderException>(() async {
          await child.removeGroup(null, notify: false);
        }, 'Cannot add FormGroup if this one is null.');
      });

      test(
          'removeGroup throws an exception of FormBuilderException type when group is not registered.',
          () {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormArray(groups: [], validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormArray child = root.controls['child'] as FormArray;
        FormGroup groupToRemove = new FormGroup(controls: {}, validators: []);

        expect_exception<FormBuilderException>(() async {
          await child.removeGroup(groupToRemove, notify: false);
        }, 'Cannot remove FormGroup if this one is not registered.');
      });
    });
  });
}
