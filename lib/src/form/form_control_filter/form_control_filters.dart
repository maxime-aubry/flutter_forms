import 'dart:typed_data';

import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/form/form_control_filter/index.dart';

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
