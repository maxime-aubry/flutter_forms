import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';

void initializeRoot(FormGroup root) {
  ReactiveFormState formState = new ReactiveFormState();
  ReactiveFormBuilder formBuilder = new ReactiveFormBuilder(group: root);
  formBuilder.initialize(formState);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  formState.attachFormKey(formKey);
}
