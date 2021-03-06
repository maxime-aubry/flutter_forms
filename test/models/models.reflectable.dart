// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'models.dart' as prefix1;
import 'package:flutter_forms/src/annotations/flutter_forms_validator.dart'
    as prefix0;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.FlutterFormsValidator(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'EGender',
            r'test.models.EGender',
            524295,
            0,
            const prefix0.FlutterFormsValidator(),
            const <int>[1],
            const <int>[3, 1, 4, 5, 6, 2],
            const <int>[],
            -1,
            {},
            {},
            {},
            0,
            -1,
            const <int>[-1],
            const <Object>[prefix0.flutterFormsValidator],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(r'index', 33861, 0,
            const prefix0.FlutterFormsValidator(), -1, 1, 1, null, const []),
        r.MethodMirrorImpl(r'toString', 131138, 0, -1, 2, 2, null,
            const <int>[], const prefix0.FlutterFormsValidator(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.FlutterFormsValidator(), 0, 2),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 3, 3, null, const <int>[0],
            const prefix0.FlutterFormsValidator(), const []),
        r.MethodMirrorImpl(r'noSuchMethod', 65538, null, null, null, null, null,
            const <int>[1], const prefix0.FlutterFormsValidator(), const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 1, 1, null,
            const <int>[], const prefix0.FlutterFormsValidator(), const []),
        r.MethodMirrorImpl(r'runtimeType', 131075, null, -1, 4, 4, null,
            const <int>[], const prefix0.FlutterFormsValidator(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'other',
            32774,
            3,
            const prefix0.FlutterFormsValidator(),
            -1,
            5,
            5,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            4,
            const prefix0.FlutterFormsValidator(),
            -1,
            6,
            6,
            null,
            const [],
            null,
            null)
      ],
      <Type>[prefix1.EGender, int, String, bool, Type, Object, Invocation],
      1,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'index': (dynamic instance) => instance.index
      },
      {},
      <m.LibraryMirror>[
        r.LibraryMirrorImpl(
            r'test.models',
            Uri.parse(r'reflectable://0/test.models'),
            const prefix0.FlutterFormsValidator(),
            const <int>[],
            {},
            {},
            const <Object>[prefix0.flutterFormsValidator],
            null)
      ],
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
