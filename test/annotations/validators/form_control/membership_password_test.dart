import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/fake_initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > MembershipPassword.',
      () {
    group('Valid.', () {
      test('Password is valid with all options.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: true,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'P@$$w0rd');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, true);
        expect(validator.includesUppercaseAlphabeticalCharacters, true);
        expect(validator.includesNumericalCharacters, true);
        expect(validator.includesSpecialCharacters, true);
      });

      test('Password is valid with minLength = 3 and maxLength = 3.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'aaa');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is valid with includesLowercaseAlphabeticalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaaaaaaaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'aaaaaaaaa');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, true);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is valid with includesUppercaseAlphabeticalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'AAAAAAAAA',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'AAAAAAAAA');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, true);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test('Password is valid with includesNumericalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'111111111',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: true,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'111111111');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, true);
        expect(validator.includesSpecialCharacters, false);
      });

      test('Password is valid with includesSpecialCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'@@@@@@@@@',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, r'@@@@@@@@@');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, true);
      });

      test('Password is null.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: true,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Password is invalid with minLength = 3 and maxLength = 3.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 3,
          maxLength: 3,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, r'aaaa');
        expect(validator.minLength, 3);
        expect(validator.maxLength, 3);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is invalid with includesLowercaseAlphabeticalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'AAAAAAAAA',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, r'AAAAAAAAA');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, true);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test(
          'Password is invalid with includesUppercaseAlphabeticalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaaaaaaaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, r'aaaaaaaaa');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, true);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, false);
      });

      test('Password is invalid with includesNumericalCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaaaaaaaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: true,
          includesSpecialCharacters: false,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, r'aaaaaaaaa');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, true);
        expect(validator.includesSpecialCharacters, false);
      });

      test('Password is invalid with includesSpecialCharacters = true.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'aaaaaaaaa',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: true,
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, r'aaaaaaaaa');
        expect(validator.minLength, 6);
        expect(validator.maxLength, 12);
        expect(validator.includesLowercaseAlphabeticalCharacters, false);
        expect(validator.includesUppercaseAlphabeticalCharacters, false);
        expect(validator.includesNumericalCharacters, false);
        expect(validator.includesSpecialCharacters, true);
      });
    });

    group('getErrorDetails.', () {
      test('All criteria are true.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: true,
          includesSpecialCharacters: true,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'P@$$w0rd');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isTrue,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isTrue,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isTrue);
        expect(details.keys.contains('includesSpecialCharacters'), isTrue);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isTrue);
        expect(details['includesLowercaseAlphabeticalCharacters'], isTrue);
        expect(details['includesUppercaseAlphabeticalCharacters'], isTrue);
        expect(details['includesNumericalCharacters'], isTrue);
        expect(details['includesSpecialCharacters'], isTrue);
      });

      test('Password is invalid, because of minLength.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'abcde',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'abcde');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isFalse);
        expect(details.keys.contains('includesSpecialCharacters'), isFalse);
        expect(details['minLength'], isFalse);
        expect(details['maxLength'], isTrue);
      });

      test('Password is invalid, because of maxLength.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'abcdefghijklm',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'abcdefghijklm');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isFalse);
        expect(details.keys.contains('includesSpecialCharacters'), isFalse);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isFalse);
      });

      test(
          'Password is invalid, because of includesLowercaseAlphabeticalCharacters.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'ABCDEF',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: true,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'ABCDEF');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isTrue,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isFalse);
        expect(details.keys.contains('includesSpecialCharacters'), isFalse);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isTrue);
        expect(details['includesLowercaseAlphabeticalCharacters'], isFalse);
      });

      test(
          'Password is invalid, because of includesUppercaseAlphabeticalCharacters.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'abcdef',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: true,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'abcdef');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isTrue,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isFalse);
        expect(details.keys.contains('includesSpecialCharacters'), isFalse);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isTrue);
        expect(details['includesUppercaseAlphabeticalCharacters'], isFalse);
      });

      test('Password is invalid, because of includesNumericalCharacters.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'abcdef',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: true,
          includesSpecialCharacters: false,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'abcdef');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isTrue);
        expect(details.keys.contains('includesSpecialCharacters'), isFalse);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isTrue);
        expect(details['includesNumericalCharacters'], isFalse);
      });

      test('Password is invalid, because of includesSpecialCharacters.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'abcdef',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: true,
          error: null,
        );

        Map<String, bool> details =
            validator.getErrorDetails(formControl.value);
        expect(formControl.value, r'abcdef');
        expect(details, isNotNull);
        expect(details.keys.contains('minLength'), isTrue);
        expect(details.keys.contains('maxLength'), isTrue);
        expect(
          details.keys.contains('includesLowercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(
          details.keys.contains('includesUppercaseAlphabeticalCharacters'),
          isFalse,
        );
        expect(details.keys.contains('includesNumericalCharacters'), isFalse);
        expect(details.keys.contains('includesSpecialCharacters'), isTrue);
        expect(details['minLength'], isTrue);
        expect(details['maxLength'], isTrue);
        expect(details['includesSpecialCharacters'], isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when minLength is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: null,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'minLength is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when maxLength is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: null,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'maxLength is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when minLength is greater than maxLength.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 12,
          maxLength: 6,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'minLength value is greater than maxLength value.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesLowercaseAlphabeticalCharacters is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: null,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'includesLowercaseAlphabeticalCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesUppercaseAlphabeticalCharacters is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: null,
          includesNumericalCharacters: false,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'includesUppercaseAlphabeticalCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesNumericalCharacters is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: null,
          includesSpecialCharacters: false,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'includesNumericalCharacters is not defined.');
      });

      test(
          'Throws an exception of ValidatorParameterException type when includesSpecialCharacters is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: r'P@$$w0rd',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        MembershipPassword validator = MembershipPassword(
          minLength: 6,
          maxLength: 12,
          includesLowercaseAlphabeticalCharacters: false,
          includesUppercaseAlphabeticalCharacters: false,
          includesNumericalCharacters: false,
          includesSpecialCharacters: null,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'includesSpecialCharacters is not defined.');
      });
    });
  });
}
