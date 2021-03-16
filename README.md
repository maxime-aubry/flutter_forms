[English](https://github.com/maxime-aubry/flutter_forms/blob/main/README.md) |
[Français](https://github.com/maxime-aubry/flutter_forms/blob/main/resources/translations/fr_FR/README.md)

![Pub Version](https://img.shields.io/pub/v/flutter_forms)
![GitHub](https://img.shields.io/github/license/maxime-aubry/flutter_forms)
![GitHub top language](https://img.shields.io/github/languages/top/maxime-aubry/flutter_forms)
![flutter tests](https://github.com/maxime-aubry/flutter_forms/workflows/flutter%20tests/badge.svg?branch=master)
![collection version](https://img.shields.io/badge/collection-1.15.0-brightgreen)
![constant_datetime version](https://img.shields.io/badge/collection-1.0.0-brightgreen)
![image version](https://img.shields.io/badge/collection-2.1.19-brightgreen)
![mime version](https://img.shields.io/badge/collection-1.0.0-brightgreen)
![provider version](https://img.shields.io/badge/collection-5.0.0-brightgreen)
![queries version](https://img.shields.io/badge/collection-0.1.14-brightgreen)
![reflectable version](https://img.shields.io/badge/collection-2.2.9-brightgreen)

As with Angular, reactive forms are now on Flutter !

By using `flutter_forms`, you will be able to simplify your code and validation of you forms.

## Summary

- [Getting Started](#getting-started)
    - [Requirements](#requirements)
    - [Dependencies](#dependencies)
- [Define a model file](#define-a-model-file)
- [Initialize library](#initialize-library)
- [Define a new basic form](#define-a-new-basic-form)
- [Add inputs](#add-inputs)

## Getting Started

Flutter_forms is very easy to use. First, you should learn to use Flutter.
Please, read the [online documentation](https://flutter.dev/docs) before using this library.
You will find tutorials, code labs, sample projects... Everything you need to be autonomous.

## Requirements

- Dart SDK: >=2.7.0 <3.0.0
- Flutter: >= 1.17.0

## Dependencies

You must install all these dependencies to use `flutter_forms` :

``` dart
dependencies:
  flutter:
    sdk: flutter

  build_runner: any
  reflectable: ^2.2.9
  flutter_forms: ^1.0.0
```

Then, run `flutter packages get` command on the console.

## Define a model file

First, you should define a model file.
This one will contain all you enums, if you will use them.
Into the `./lib/models.dart`, here are the differents steps we will do :
    - define a namespace for models
    - import flutter_forms
    - define a main method (for reflectable)
    - define you enums
Please, use `@flutterFormsValidator` notation to declare the content.

```dart
@flutterFormsValidator
library example.models;

import 'package:flutter_forms/flutter_forms.dart';

void main() {}

@flutterFormsValidator
enum EGender { male, female }
```

Use this command line to get the file to get a new file named `*.reflectable.dart` into a flutter application project.

```console
> flutter pub run build_runner build
```

## Initialize library

Next, into the main.dart file, you must initialize the namespace to import.
Here, you import `example.models` from `./lib/models.reflectable.dart`.

```dart
import 'package:example/models.reflectable.dart';
import 'package:flutter_forms/flutter_forms.dart';

void main() {
  initializeReflectable();
  LibraryInitializer.initialize(libraryName: 'example.models');
  runApp(new MyApp());
}
```

## Define a new basic form

Here we are. We are going to define our new form.
Into your widget, start by defining a [ReactiveForm] object.
[formBuilder] property receives the form builder.

```dart
@override
Widget build(BuildContext context) {
  return ReactiveForm(
    formBuilder: this._getFormBuilder(),
    builder: (context, _) {
      return new Container();
    },
  );
}

ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'first_name': new FormControl<String>(value: 'Maxime', validators: []),
      'last_name': new FormControl<String>(value: 'AUBRY', validators: []),
    },
    validators: [],
  ),
);
```

We just created a new form with two fields, `first_name` and `last_name`.

## Add inputs

Next, let add inputs to display on our screen.

```dart
@override
Widget build(BuildContext context) {
  return ReactiveForm(
    formBuilder: this._getFormBuilder(),
    builder: (context, _) {
      // here, we get the root level of the form builder.
      FormGroup root = context.watchFormGroup();

      return new Scaffold(
        appBar: new AppBar(title: Text("Reactive form")),
        body: new Padding(
          padding: EdgeInsets.all(5.0),
          child: new Column(
            children: [
              // here, we add inputs for first_name and last_name fields
              this._inputText(root.getFormControl<String>('first_name'), 'first name'),
              this._inputText(root.getFormControl<String>('last_name'), 'last name'),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () async {
            // here, we get the form state and validate the form
            ReactiveFormState formState = context.readFormState();
            if (await formState.validate()) {
              // Data treatment and post to server here...
            }
          },
        ),
      );
    },
  );
}

Widget _inputText(FormControl<String> formControl, String label) => 
  new TextFormField(
    decoration: InputDecoration(labelText: label),
    keyboardType: TextInputType.text,
    controller: new TextEditingController(text: formControl.value),
    onChanged: (String value) async => await formControl.setValue(value),
    onSaved: (String value) async => await formControl.setValue(value),
    validator: (String value) => formControl.error?.message,
  );
```