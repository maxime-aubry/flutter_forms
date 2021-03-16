import 'package:flutter_forms/src/annotations/index.dart';
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
      ClassMirror classMirror =
          flutterFormsValidator.reflectType(TProperty);
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
