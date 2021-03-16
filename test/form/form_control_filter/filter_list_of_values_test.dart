import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CheckListOfValues.', () {
    test('CheckListOfValues returns true for List<DateTime>.', () async {
      CheckListOfValues<List<DateTime>, List<DateTime>> checkType =
          new CheckListOfValues<List<DateTime>, List<DateTime>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<num>.', () async {
      CheckListOfValues<List<num>, List<num>> checkType =
          new CheckListOfValues<List<num>, List<num>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<int>.', () async {
      CheckListOfValues<List<int>, List<int>> checkType =
          new CheckListOfValues<List<int>, List<int>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<double>.', () async {
      CheckListOfValues<List<double>, List<double>> checkType =
          new CheckListOfValues<List<double>, List<double>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Uint8>.', () async {
      CheckListOfValues<List<Uint8>, List<Uint8>> checkType =
          new CheckListOfValues<List<Uint8>, List<Uint8>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Uint16>.', () async {
      CheckListOfValues<List<Uint16>, List<Uint16>> checkType =
          new CheckListOfValues<List<Uint16>, List<Uint16>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Uint32>.', () async {
      CheckListOfValues<List<Uint32>, List<Uint32>> checkType =
          new CheckListOfValues<List<Uint32>, List<Uint32>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Uint64>.', () async {
      CheckListOfValues<List<Uint64>, List<Uint64>> checkType =
          new CheckListOfValues<List<Uint64>, List<Uint64>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Int8>.', () async {
      CheckListOfValues<List<Int8>, List<Int8>> checkType =
          new CheckListOfValues<List<Int8>, List<Int8>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Int16>.', () async {
      CheckListOfValues<List<Int16>, List<Int16>> checkType =
          new CheckListOfValues<List<Int16>, List<Int16>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Int32>.', () async {
      CheckListOfValues<List<Int32>, List<Int32>> checkType =
          new CheckListOfValues<List<Int32>, List<Int32>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<Int64>.', () async {
      CheckListOfValues<List<Int64>, List<Int64>> checkType =
          new CheckListOfValues<List<Int64>, List<Int64>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Uint8List.', () async {
      CheckListOfValues<List<Uint8List>, List<Uint8List>> checkType =
          new CheckListOfValues<List<Uint8List>, List<Uint8List>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Uint16List.', () async {
      CheckListOfValues<Uint16List, Uint16List> checkType =
          new CheckListOfValues<Uint16List, Uint16List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Uint32List.', () async {
      CheckListOfValues<Uint32List, Uint32List> checkType =
          new CheckListOfValues<Uint32List, Uint32List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Uint64List.', () async {
      CheckListOfValues<Uint64List, Uint64List> checkType =
          new CheckListOfValues<Uint64List, Uint64List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Int8List.', () async {
      CheckListOfValues<Int8List, Int8List> checkType =
          new CheckListOfValues<Int8List, Int8List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Int16List.', () async {
      CheckListOfValues<Int16List, Int16List> checkType =
          new CheckListOfValues<Int16List, Int16List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Int32List.', () async {
      CheckListOfValues<Int32List, Int32List> checkType =
          new CheckListOfValues<Int32List, Int32List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for Int64List.', () async {
      CheckListOfValues<Int64List, Int64List> checkType =
          new CheckListOfValues<Int64List, Int64List>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<String>.', () async {
      CheckListOfValues<List<String>, List<String>> checkType =
          new CheckListOfValues<List<String>, List<String>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfValues returns true for List<bool>.', () async {
      CheckListOfValues<List<bool>, List<bool>> checkType =
          new CheckListOfValues<List<bool>, List<bool>>();
      expect(checkType.checkFilter(), true);
    });
  });
}
