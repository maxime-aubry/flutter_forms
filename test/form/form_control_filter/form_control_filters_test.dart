import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';
import '../../models/models_outside_of_library.dart';

class FormControlFilterTester<TProperty> with FormControlFilter<TProperty> {
  FormControlFilterTester() {
    super.checkAllowedFormControlType();
  }
}

class FormControlCustomFilterTester<TProperty>
    with FormControlFilter<TProperty> {
  FormControlCustomFilterTester() {
    List<ICheckFilter> filters = [
      new CheckEnum<TProperty>(),
    ];
    super.checkAllowedFormControlType(filters: filters);
  }
}

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('FormControlFilter.', () {
    test('FormControlFilter allows EGender.', () {
      FormControlFilterTester<EGender> tester =
          new FormControlFilterTester<EGender>();
      expect(tester, isNotNull);
    });

    test('FormControlFilter does not allow EFakeEnum.', () {
      expect(() {
        new FormControlFilterTester<EFakeEnum>();
      }, throwsA(isInstanceOf<Exception>()));
    });

    test('FormControlFilter allows EGender using by restricted filters.', () {
      FormControlCustomFilterTester<EGender> tester =
          new FormControlCustomFilterTester<EGender>();
      expect(tester, isNotNull);
    });

    test(
        'FormControlFilter does not allow DateTime using by restricted filters.',
        () {
      expect(() {
        new FormControlCustomFilterTester<DateTime>();
      }, throwsA(isInstanceOf<Exception>()));
    });
  });
}
