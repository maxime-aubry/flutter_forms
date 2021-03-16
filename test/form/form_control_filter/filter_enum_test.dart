import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';
import '../../models/models_outside_of_library.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('CheckEnum.', () {
    test('CheckEnum returns true for EGender.', () async {
      CheckEnum<EGender> checkType = new CheckEnum<EGender>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckEnum returns false for EFakeEnum.', () async {
      CheckEnum<EFakeEnum> checkType = new CheckEnum<EFakeEnum>();
      expect(checkType.checkFilter(), false);
    });

    test('CheckEnum returns false for DateTime.', () async {
      CheckEnum<DateTime> checkType = new CheckEnum<DateTime>();
      expect(checkType.checkFilter(), false);
    });
  });
}
