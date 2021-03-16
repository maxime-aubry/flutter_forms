import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Annotations > Validators > Common > Required (on FormArray).', () {
    group('Valid.', () {
      test('FormArray\'s groups are populated.', () async {
        FormArray formArray = new FormArray(
          groups: [
            new FormGroup(controls: {}, validators: []),
          ],
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formArray);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('FormArray\'s groups are null.', () async {
        FormArray formArray = new FormArray(
          groups: null,
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });

      test('FormArray\'s groups are empty.', () async {
        FormArray formArray = new FormArray(
          groups: [],
          validators: [],
        );
        Required validator = Required(error: null);

        bool isValid = await validator.isValid(formArray);
        expect(isValid, isFalse);
      });
    });
  });
}
