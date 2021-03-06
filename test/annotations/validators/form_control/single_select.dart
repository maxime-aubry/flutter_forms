import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/initializer.dart';
import '../../../models/models.dart';
import '../../../models/models.reflectable.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Annotations > Validators > FormControl<TProperty> > SingleSelect.',
      () {
    group('Valid.', () {
      test('Value is into list of items.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<EGender>(
              value: EGender.male,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<EGender> formControl =
            root.controls['child'] as FormControl<EGender>;
        SingleSelect validator = SingleSelect(
          serviceName: 'getItems',
          error: null,
        );

        ListItemsProvider.clear();
        ListItemsProvider.register<EGender>(
            'getItems',
            () async => [
                  new SelectListItem<EGender>(EGender.male, 'male'),
                  new SelectListItem<EGender>(EGender.female, 'female'),
                ]);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, EGender.male);
      });

      test('value is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<EGender>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<EGender> formControl =
            root.controls['child'] as FormControl<EGender>;
        SingleSelect validator = SingleSelect(
          serviceName: 'getItems',
          error: null,
        );

        ListItemsProvider.clear();
        ListItemsProvider.register<EGender>(
            'getItems',
            () async => [
                  new SelectListItem<EGender>(EGender.male, 'male'),
                  new SelectListItem<EGender>(EGender.female, 'female'),
                ]);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
      });

      test('Add items to service after initialization.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<EGender>(
              value: EGender.male,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<EGender> formControl =
            root.controls['child'] as FormControl<EGender>;
        SingleSelect validator = SingleSelect(
          serviceName: 'getItems',
          error: null,
        );

        List<SelectListItem<EGender>> items = [
          new SelectListItem<EGender>(EGender.male, 'male'),
          new SelectListItem<EGender>(EGender.female, 'female'),
        ];
        ListItemsProvider.clear();
        ListItemsProvider.register<EGender>('getItems', () async => items);
        items.add(new SelectListItem<EGender>(EGender.other, 'other'));

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, EGender.male);
      });
    });

    group('Invalid.', () {
      test('Value is not into list of items.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<EGender>(
              value: EGender.other,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<EGender> formControl =
            root.controls['child'] as FormControl<EGender>;
        SingleSelect validator = SingleSelect(
          serviceName: 'getItems',
          error: null,
        );

        ListItemsProvider.clear();
        ListItemsProvider.register<EGender>(
            'getItems',
            () async => [
                  new SelectListItem<EGender>(EGender.male, 'male'),
                  new SelectListItem<EGender>(EGender.female, 'female'),
                ]);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, EGender.other);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when items is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<EGender>(
              value: EGender.other,
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<EGender> formControl =
            root.controls['child'] as FormControl<EGender>;
        SingleSelect validator = SingleSelect(
          serviceName: 'getItems',
          error: null,
        );

        ListItemsProvider.clear();
        ListItemsProvider.register<EGender>('getItems', () async => null);

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'items is not defined.');
      });
    });
  });
}
