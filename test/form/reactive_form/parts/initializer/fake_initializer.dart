import 'package:flutter_forms/flutter_forms.dart';

void fakeInitializeRoot(FormGroup root) =>
    _initializeFormGroup(root, 'root', null, false);

void _initializeFormGroup(
  FormGroup formGroup,
  String name,
  FormGroup parent,
  bool isArrayItem,
) {
  formGroup.name = name;
  formGroup.parent = parent;
  formGroup.isArrayItem = isArrayItem;
  formGroup.isInitialized = true;

  for (MapEntry<String, AbstractControl> control
      in formGroup.controls.entries) {
    if (control.value is FormGroup)
      _initializeFormGroup(control.value, control.key, formGroup, false);

    if (control.value is FormArray)
      _initializeFormArray(control.value, control.key, formGroup);

    if (control.value is FormControl)
      _initializeFormControl(control.value, control.key, formGroup);
  }
}

void _initializeFormArray(
  FormArray formArray,
  String name,
  FormGroup parent,
) {
  formArray.name = name;
  formArray.parent = parent;
  formArray.isInitialized = true;

  for (FormGroup group in formArray.groups) {
    _initializeFormGroup(
      group,
      '$name[${formArray.groups.indexOf(group)}]',
      parent,
      true,
    );
  }
}

void _initializeFormControl(
  FormControl formControl,
  String name,
  FormGroup parent,
) {
  formControl.name = name;
  formControl.parent = parent;
  formControl.isInitialized = true;
}
