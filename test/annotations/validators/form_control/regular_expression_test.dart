import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../form/reactive_form/parts/initializer/initializer.dart';

void main() {
  group(
      'Annotations > Validators > FormControl<TProperty> > RegularExpression.',
      () {
    group('Valid.', () {
      test('value matches to regexp.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'Hello', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        RegularExpression validator = RegularExpression(
          expression: r'^(Hello|Bye)$',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, 'Hello');
        expect(validator.expression, r'^(Hello|Bye)$');
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
        RegularExpression validator = RegularExpression(
          expression: r'^(Hello|Bye)$',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
        expect(formControl.value, isNull);
        expect(validator.expression, r'^(Hello|Bye)$');
      });
    });

    group('Invalid.', () {
      test('value is not valid.', () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(
              value: 'Hello world!',
              validators: [],
            ),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        RegularExpression validator = RegularExpression(
          expression: r'^(Hello|Bye)$',
          error: null,
        );

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
        expect(formControl.value, 'Hello world!');
        expect(validator.expression, r'^(Hello|Bye)$');
      });
    });

    group('Exceptions.', () {
      test(
          'Throws an exception of ValidatorParameterException type when expression is null.',
          () async {
        FormGroup root = new FormGroup(
          controls: {
            'child': new FormControl<String>(value: 'Hello', validators: []),
          },
          validators: [],
        );
        initializeRoot(root);

        FormControl<String> formControl =
            root.controls['child'] as FormControl<String>;
        RegularExpression validator = RegularExpression(
          expression: null,
          error: null,
        );

        expect_exception<ValidatorParameterException>(() async {
          await validator.isValid(formControl);
        }, 'Regular expression is not defined.');
      });
    });
  });
}
