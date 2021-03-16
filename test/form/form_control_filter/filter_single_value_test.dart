import 'dart:ffi';

import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CheckSingleValue.', () {
    test('CheckSingleValue returns true for DateTime.', () async {
      CheckSingleValue<DateTime, DateTime> checkType =
          new CheckSingleValue<DateTime, DateTime>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for num.', () async {
      CheckSingleValue<num, num> checkType = new CheckSingleValue<num, num>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for int.', () async {
      CheckSingleValue<int, int> checkType = new CheckSingleValue<int, int>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for double.', () async {
      CheckSingleValue<double, double> checkType =
          new CheckSingleValue<double, double>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Uint8.', () async {
      CheckSingleValue<Uint8, Uint8> checkType =
          new CheckSingleValue<Uint8, Uint8>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Uint16.', () async {
      CheckSingleValue<Uint16, Uint16> checkType =
          new CheckSingleValue<Uint16, Uint16>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Uint32.', () async {
      CheckSingleValue<Uint32, Uint32> checkType =
          new CheckSingleValue<Uint32, Uint32>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Uint64.', () async {
      CheckSingleValue<Uint64, Uint64> checkType =
          new CheckSingleValue<Uint64, Uint64>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Int8.', () async {
      CheckSingleValue<Int8, Int8> checkType =
          new CheckSingleValue<Int8, Int8>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Int16.', () async {
      CheckSingleValue<Int16, Int16> checkType =
          new CheckSingleValue<Int16, Int16>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Int32.', () async {
      CheckSingleValue<Int32, Int32> checkType =
          new CheckSingleValue<Int32, Int32>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for Int64.', () async {
      CheckSingleValue<Int64, Int64> checkType =
          new CheckSingleValue<Int64, Int64>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for String.', () async {
      CheckSingleValue<String, String> checkType =
          new CheckSingleValue<String, String>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckSingleValue returns true for bool.', () async {
      CheckSingleValue<bool, bool> checkType =
          new CheckSingleValue<bool, bool>();
      expect(checkType.checkFilter(), true);
    });
  });
}
