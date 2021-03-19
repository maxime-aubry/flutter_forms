import 'dart:typed_data';

import 'package:flutter_forms/src/annotations/index.dart';
import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/index.dart';
import 'package:reflectable/reflectable.dart';

abstract class ICheckFilter {
  bool checkFilter();
}

class CheckSingleValue<TProperty, TValue> implements ICheckFilter {
  @override
  bool checkFilter() => (TProperty == TValue);
}

class CheckListOfValues<TProperty, TList extends List> implements ICheckFilter {
  @override
  bool checkFilter() => (TProperty == TList);
}

class CheckEnum<TProperty> implements ICheckFilter {
  @override
  bool checkFilter() {
    try {
      ClassMirror classMirror = flutterFormsValidator.reflectType(TProperty);
      return classMirror?.isEnum ?? false;
    } catch (_) {
      return false;
    }
  }
}

class CheckListOfEnum<TProperty> implements ICheckFilter {
  @override
  bool checkFilter() {
    String seekedType = TProperty.toString();
    if (!this._isList(seekedType)) return false;
    String enumType = this._getEnumStringType(seekedType);
    bool isEnum = this._isSeekedTypeAnEnum(enumType);
    return isEnum;
  }

  bool _isList(String seekedType) =>
      (seekedType.startsWith('List<') && seekedType.endsWith('>'));

  String _getEnumStringType(String seekedType) {
    final RegExp regexp = RegExp(r'^List<([a-zA-Z]+)>$');
    Iterable<RegExpMatch> matches = regexp.allMatches(seekedType);
    RegExpMatch match = matches.elementAt(0);
    String enumType = match.group(1);
    if (enumType.isEmpty || enumType == ' ') throw new Exception();
    return enumType;
  }

  bool _isSeekedTypeAnEnum(String enumType) {
    try {
      LibraryMirror libraryMirror =
          flutterFormsValidator.findLibrary(LibraryInitializer.libraryName);
      if (libraryMirror == null) return false;
      ClassMirror classMirror = libraryMirror.declarations[enumType];
      return classMirror?.isEnum ?? false;
    } catch (_) {
      return false;
    }
  }
}

/// {@category Form}
/// {@subCategory FormControl filters}
mixin FormControlFilter<TProperty> {
  /* Public properties */

  /* Protected properties */

  /* Private properties */
  final List<ICheckFilter> _filters = [
    new CheckSingleValue<TProperty, DateTime>(),
    new CheckSingleValue<TProperty, num>(),
    new CheckSingleValue<TProperty, int>(),
    new CheckSingleValue<TProperty, double>(),
    // new CheckSingleValue<TProperty, Uint8>(),
    // new CheckSingleValue<TProperty, Uint16>(),
    // new CheckSingleValue<TProperty, Uint32>(),
    // new CheckSingleValue<TProperty, Uint64>(),
    // new CheckSingleValue<TProperty, Int8>(),
    // new CheckSingleValue<TProperty, Int16>(),
    // new CheckSingleValue<TProperty, Int32>(),
    // new CheckSingleValue<TProperty, Int64>(),
    new CheckSingleValue<TProperty, String>(),
    new CheckSingleValue<TProperty, bool>(),
    new CheckListOfValues<TProperty, List<DateTime>>(),
    new CheckListOfValues<TProperty, List<num>>(),
    new CheckListOfValues<TProperty, List<int>>(),
    new CheckListOfValues<TProperty, List<double>>(),
    // new CheckListOfValues<TProperty, List<Uint8>>(),
    // new CheckListOfValues<TProperty, List<Uint16>>(),
    // new CheckListOfValues<TProperty, List<Uint32>>(),
    // new CheckListOfValues<TProperty, List<Uint64>>(),
    // new CheckListOfValues<TProperty, List<Int8>>(),
    // new CheckListOfValues<TProperty, List<Int16>>(),
    // new CheckListOfValues<TProperty, List<Int32>>(),
    // new CheckListOfValues<TProperty, List<Int64>>(),
    new CheckListOfValues<TProperty, Uint8List>(),
    new CheckListOfValues<TProperty, Uint16List>(),
    new CheckListOfValues<TProperty, Uint32List>(),
    new CheckListOfValues<TProperty, Uint64List>(),
    new CheckListOfValues<TProperty, Int8List>(),
    new CheckListOfValues<TProperty, Int16List>(),
    new CheckListOfValues<TProperty, Int32List>(),
    new CheckListOfValues<TProperty, Int64List>(),
    new CheckListOfValues<TProperty, List<String>>(),
    new CheckListOfValues<TProperty, List<bool>>(),
    new CheckEnum<TProperty>(),
    new CheckListOfEnum<TProperty>(),
  ];

  /* Getters */

  /* Setters */

  /* Constructors */

  /* Public methods */
  void checkAllowedFormControlType({List<ICheckFilter> filters = null}) {
    bool isAllowed = false;

    for (ICheckFilter filter in (filters ?? this._filters)) {
      if (filter.checkFilter()) {
        isAllowed = true;
        break;
      }
    }

    if (!isAllowed) {
      throw new FormControlFilterException(
        '''Cannot instantiate a FormControlElement with a not allowed type $TProperty.
        Allowed types are : DateTime, num, int, double, Uint8, Uint16, Uint32, Uint64, Int8, Int16, Int32, Int64, String, bool, enums, List<DateTime>, List<num>, List<int>, List<double>, Uint8List, Uint16List, Uint32List, Uint64List, Int8List, Int16List, Int32List, Int64List, List<String>, List<bool> and a list of enum.''',
      );
    }
  }

  /* Protected methods */

  /* Private methods */
}
