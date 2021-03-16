import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Annotations > Validators > Common > Required (on FormControl).', () {
    group('Valid.', () {
      test('FormControl\'s value is valid.', () async {
        FormControl<String> formControl = new FormControl<String>(
          value: 'azerty',
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormControl\'s value is null.', () async {
        FormControl<String> formControl = new FormControl<String>(
          value: null,
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
      });

      test('FormControl\'s value is empty.', () async {
        FormControl<String> formControl = new FormControl<String>(
          value: '',
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formControl);
        expect(isValid, isFalse);
      });
    });
  });
}
