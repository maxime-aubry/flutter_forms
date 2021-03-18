[English](https://github.com/maxime-aubry/flutter_forms/blob/main/README.md) |
[Français](https://github.com/maxime-aubry/flutter_forms/blob/main/resources/translations/fr_FR/README.md)

[![Run tests](https://github.com/maxime-aubry/flutter_forms/actions/workflows/build_and_test.yaml/badge.svg?branch=main&event=push)](https://github.com/maxime-aubry/flutter_forms/actions/workflows/build_and_test.yaml)
![GitHub](https://img.shields.io/github/license/maxime-aubry/flutter_forms)
![GitHub top language](https://img.shields.io/github/languages/top/maxime-aubry/flutter_forms)
![Pub Version](https://img.shields.io/pub/v/flutter_forms)
![collection version](https://img.shields.io/badge/collection-1.15.0-brightgreen)
![constant_datetime version](https://img.shields.io/badge/constant_datetime-1.0.0-brightgreen)
![image version](https://img.shields.io/badge/image-2.1.19-brightgreen)
![mime version](https://img.shields.io/badge/mime-1.0.0-brightgreen)
![provider version](https://img.shields.io/badge/provider-5.0.0-brightgreen)
![queries version](https://img.shields.io/badge/queries-0.1.14-brightgreen)
![reflectable version](https://img.shields.io/badge/reflectable-2.2.9-brightgreen)

As with **Angular**, reactive forms are now on [Flutter] !

By using **flutter_forms**, you will be able to simplify your code and validation of you forms.

## Summary

- [Getting Started](#getting-started)
    - [Requirements](#requirements)
    - [Dependencies](#dependencies)
- [FormBuilder](#formbuilder)
    - [FormGroup](#formgroup)
        - [Add control to a FormGroup](#add-control-to-a-formgroup)
        - [Remove control from a FormGroup](#remove-control-from-a-formgroup)
        - [Check if a control exists into a FormGroup](#check-if-a-control-exists-into-a-formgroup)
        - [Get a FormGroup child](#get-a-formgroup-child)
        - [Get a FormArray child](#get-a-formarray-child)
        - [Get a FormControl child](#get-a-formcontrol-child)
    - [FormArray](#formarray)
        - [Add item to a FormArray](#add-item-to-a-formarray)
        - [Remove item from a FormArray](#remove-item-from-a-formarray)
    - [FormControl](#formcontrol)
        - [Set a value](#set-a-value)
    - [Clone a form element](#clone-a-form-element)
- [How to add a reactive form into an application?](#how-to-add-a-reactive-form-into-an-application)
    - [Define a model file](#define-a-model-file)
    - [Initialize library](#initialize-library)
    - [Define a new basic form](#define-a-new-basic-form)
    - [Add inputs](#add-inputs)
- [How to add a reactive form with multiple steps into an application?](#how-to-add-a-reactive-form-with-multiple-steps-into-an-application)
- [What about validators?](#what-about-validators)
    - [Add validators](#add-validators)
    - [Create validators](#create-validators)
- [Providers and Consumers](#providers-and-consumers)
    - [FormProvider](#formprovider)
    - [ReactiveFormStateProvider](#reactiveformstateprovider)
    - [FormGroupProvider](#formgroupprovider)
    - [FormArrayProvider](#formarrayprovider)
    - [FormControlProvider](#formcontrolprovider)
    - [MultipleStepFormStateIndexerProvider](#multiplestepformstateindexerprovider)
- [See more examples](#see-more-examples)

## Getting Started

**flutter_forms** is very easy to use. First, you should learn to use **Flutter**.

Please, read the [online documentation](https://flutter.dev/docs) before using this library.

You will find tutorials, code labs, sample projects... Everything you need to be autonomous.

## Requirements

- Dart SDK: >=2.7.0 <3.0.0
- Flutter: >= 1.17.0

## Dependencies

You must install all these dependencies to use **flutter_forms** :

``` dart
dependencies:
  flutter:
    sdk: flutter

  build_runner: any
  reflectable: ^2.2.9
  flutter_forms: ^1.0.0
```

Then, run **flutter packages get** command on the console.

## FormBuilder

**flutter_forms** is inspired by Angular reactive forms.

Of course, FormBuilder is the starting point of form creation.

Here is the way to build a form :

```dart
ReactiveFormBuilder form_builder = new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'first_name': new FormControl<String>(value: null, validators: []),
      'last_name': new FormControl<String>(value: null, validators: []),
    },
    validators: [],
  ),
);
```

A form is created and automatically instantiated when you add it to **ReactiveForm** widget. It provides a complete tree of form elements to use.

> It's a simplified version of **Angular reactive forms**.
> As for **Angular reactive forms**, **flutter_forms** can create dynamic forms.
> Lets see all these points together !

## FormGroup

First you have the **FormGroup**. This one is a group of **FormGroup**, **FormArray** and **FormControl**.

You must use them for complex forms, with multiple levels.

Imagine you have a to set your profile. You could have two distinct parts into this form.

```dart
ReactiveFormBuilder form_builder = new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'personal': new FormGroup(
        controls: {
          'first_name': new FormControl<String>(value: null, validators: []),
          'last_name': new FormControl<String>(value: null, validators: []),
        },
        validators: [],
      ),
      'social_links': new FormGroup(
        controls: {
          'github': new FormControl<String>(value: null, validators: []),
          'facebook': new FormControl<String>(value: null, validators: []),
        },
        validators: [],
      )
    },
    validators: [],
  ),
);
```

## Add control to a FormGroup

How to add a sub part of you form dynamically ?

Here is a short code to add a **FormGroup** in the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormGroup child = new FormGroup(controls: {}, validators: []);
root.addControl('child', child);
```

Here is a short code to add a **FormArray** in the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormArray child = new FormArray(groups: [], validators: []);
root.addControl('child', child);
```

Finally, here is a short code to add a **FormControl** in the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormControl<String> child = new FormControl<String>(value: null, validators: []);
root.addControl('child', child);
```

## Remove control from a FormGroup

Here is a short code to remove a **FormGroup** from the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> That function will trigger the validation engine and update the form to display errors if there are.

Here is a short code to remove a **FormArray** from the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormArray(groups: [], validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> That function will trigger the validation engine and update the form to display errors if there are.

Finally, here is a short code to remove a **FormControl** from the children collection of a **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> That function will trigger the validation engine and update the form to display errors if there are.

## Check if a control exists into a FormGroup

How to check if a control does exist into a **FormGroup** ?

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
bool exists = root.containsControl('child');
```

## Get a FormGroup child

How to get a FormGroup child ?

**DON'T DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
FormGroup child = root.controls['child'] as FormGroup;
```

**DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
FormGroup child = root.getFormGroup('child');
```

## Get a FormArray child

How to get a FormArray child ?

**DON'T DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
FormControl<String> child = root.controls['child'] as FormControl<String>;
```

**DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
FormControl<String> child = root.getFormControl<String>('child');
```

## Get a FormControl child

How to get a FormArray child ?

**DON'T DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormArray(groups: [], validators: []),
  },
  validators: [],
);
FormArray child = root.controls['child'] as FormArray;
```

**DO THIS !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormArray(groups: [], validators: []),
  },
  validators: [],
);
FormArray child = root.getFormArray('child');
```

## FormArray

Next you have the **FormArray**. This one is a collection of **FormGroup** only.

This a difference with Angular's library. I disagree with the fact a **FormArray** can contain directly **FormControl** items.

In my opinion, Angular **FormArray** is too permissive. Developer could try to add **FormGroup** and **FormControl** items into the same **FormArray**.

This should not be possible, even if an exception is thrown after.

So, here is the way to declare a **FormArray** :

```dart
ReactiveFormBuilder form_builder = new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'social_links': new FormArray(
        groups: [
          new FormGroup(
            controls: {
              'social_network': new FormControl<String>(value: 'github', validators: []),
              'url': new FormControl<String>(value: 'https://github.com/maxime-aubry/', validators: []),
            },
            validators: [],
          ),
        ],
        validators: [],
      )
    },
    validators: [],
  ),
);
```

> As you can see, you can register complex data into an item of a **FormArray**.

## Add item to a FormArray

Add an item to a **FormArray** is easy.
Remember that you can add **FormGroup** items only.

Here is the way to add an item :

```dart
FormArray array = new FormArray(groups: [], validators: []);
FormGroup child = new FormGroup(controls: {}, validators: []);
array.addGroup(child);
```

> That function will trigger the validation engine and update the form to display errors if there are.

## Remove item from a FormArray

Here is the way to remove an item :

```dart
FormArray array = new FormArray(
  groups: [
    // an item is here
  ],
  validators: [],
);
FormGroup child = new FormGroup(controls: {}, validators: []);
array.removeGroup(child);
```

> That function will trigger the validation engine and update the form to display errors if there are.
> This part is a little confuse because you don't see how to get an item from the form array. Lets see that later.

## FormControl

What would be a form if we didn't use **FormControl** ?

This is the way to store data, while **FormGroup** and **FormArray** are used for the structure !

**FormControl** are done to support a limited list of data types :
- **DateTime**.
- **num** (Number).
- **int**.
- **double**.
- **String**.
- **bool**.
- List of **DateTime**.
- List of **num**.
- List of **int**.
- List of **double**.
- List of **String**.
- List of **bool**.
- **Uint8List**, **Uint16List**, **Uint32List**, **Uint64List**, **Int8List**, **Int16List**, **Int32List** and **Int64List** (for **buffer arrays**).
- **enums**.
- list of **enums**.

If you try to use a disallowed type, an exception will be thrown.

This list could evolve later.

Here is the way to declare a FormControl with String generic type :

```dart
ReactiveFormBuilder form_builder = new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'first_name': new FormControl<String>(value: 'Maxime', validators: []),
    },
    validators: [],
  ),
);
```

## Set a value

Here is the way to set a value to a **FormControl** :

```dart
FormControl<String> control = new FormControl<String>(value: null, validators: []);
control.setValue('my value');
```

> That function will trigger the validation engine and update the form to display errors if there are.

## Clone a form element

Clone a form element is a very important point of **flutter_forms**.

Imagine you are modifying an item of your form, as a sub **FormGroup**. You changes values, and you decide to click on cancel button.

Rollback your values could be hard !

So, you should clone the part of the form you want to update, and apply those changes later if you want.

When you clone a form element, you clone the full tree of **ReactiveFormBuilder**, so you can use you validators to compare a value with another.

Here is an example :

```dart
ReactiveFormBuilder form_builder = new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'first_name': new FormControl<String>(value: 'Maxime', validators: []),
    },
    validators: [],
  ),
);
FormControl<String> child = form_builder.group.getFormControl<String>('first_name');
FormControl<String> clone = child.getClone();
```

> Whether for **FormGroup**, **FormArray** or **FormControl**, you can use the same **getClone()** method.

## How to add a reactive form into an application?

Now we studied the basics of **flutter_forms**, lets see how to create a form into a [Flutter] application.

## Define a model file

First, you should define a model file.

This one will contain all you enums, if you will use them.

Into the **./lib/models.dart**, here are the different steps we will do :

- define a namespace for models
- import flutter_forms
- define a **main()** method (for reflectable)
- define you enums

If you does not define your enums here, they will be refused with FormControl later. An exception will be thrown.
    
Please, use **@flutterFormsValidator** notation to declare the content.

```dart
@flutterFormsValidator
library example.models;

import 'package:flutter_forms/flutter_forms.dart';

void main() {}

@flutterFormsValidator
enum EGender { male, female }
```

Use this command line to get the file to get a new file named **models.reflectable.dart** into a flutter application project.

```console
> flutter pub run build_runner build
```

## Initialize library

Next, into the main.dart file, you must initialize the namespace to import.

Here, you import **example.models** from **./lib/models.reflectable.dart**.

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

We just created a new form with two fields, **first_name** and **last_name**.

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
    // here, we set the value into the FormControl
    onChanged: (String value) async => await formControl.setValue(value),
    // here, we set the value into the FormControl
    onSaved: (String value) async => await formControl.setValue(value),
    // here, we display the error if there is one
    validator: (String value) => formControl.error?.message,
  );
```

## How to add a reactive form with multiple steps into an application?

**flutter_forms** supports forms with multiples steps !

You must add your forms into a container that will assemble all form states.

Lets see an easy example.

Here is the main screen :

```dart
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Reactive multiple steps form")),
      body: new MultipleStepFormContainer(
        builder: (context, _) {
          return new Stepper(
            onStepContinue: () async {
              // here we get all steps names
              List<String> stepsNames =
                  context.readMultipleStepFormStateIndexer().keys.toList();
    
              // here we get the form state for the targeted step name
              ReactiveFormState formState = context.readFormState(
                step: stepsNames[currentStep],
              );
    
              // here we validate the current step
              if (await formState.validate()) {
                // Data treatment and post to server here...
              }
            },
          );
        },
      ),
    );
  }
```

Here is a step :

```dart
@override
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'profile', // here we define the step name
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        // form content here
        return new Container();
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'first_name': new FormControl<String>(value: null, validators: []),
            'last_name': new FormControl<String>(value: null, validators: []),
          },
          validators: [],
        ),
      );
```

Here is another step :

```dart
@override
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'social_links', // here we define the step name
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        // form content here
        return new Container();
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'social_links': new FormArray(groups: [], validators: []),
          },
          validators: [],
        ),
      );
```

## What about validators?

What would be this library without validators ? NOTHING !

## Add validators

So, here is a list of available validators :

Common :

| Validator | Description  | Progress |
| ----- | ----- | ----- |
| **Required** | Validate a FormGroup, FormArray and FormControl. Checks if a FormGroup is not null and contains controls. Checks if a FormArray is not null and contains items. Checks if a FormControl is not null. If this one is a string, checks if it's not an empty string. | **done** |

FormGroup :

> There are not validators for FormGroup for this time.

FormArray :

| Validator | Description  | Progress |
| ----- | ----- | ----- |
| **NbItems** | Checks if a FormArray has a valid length. | **done** |

FormControls :

| Validator | Description  | Progress |
| ----- | ----- | ----- |
| **Email** | Checks if a value is a valid email. | **done** |
| **EqualToDateTime** | Checks if a datetime value is equal to another. | **done** |
| **EqualToDouble** | Checks if a double value is equal to another. | **done** |
| **EqualToInt** | Checks if a int value is equal to another. | **done** |
| **EqualToNumber** | Checks if a number value is equal to another. | **done** |
| **EqualToString** | Checks if a string value is equal to another. | **done** |
| **FileMimeType** | Checks if a file has an allowed mime type. | **done** |
| **FileSize** | Checks if a file has an allowed size. | **done** |
| **GreaterOrEqualToDateTime** | Checks if a datetime value is greater or equal to another. | **done** |
| **GreaterOrEqualToDouble** | Checks if a double value is greater or equal to another. | **done** |
| **GreaterOrEqualToInt** | Checks if a int value is greater or equal to another. | **done** |
| **GreaterOrEqualToNumber** | Checks if a number value is greater or equal to another. | **done** |
| **GreaterOrEqualToString** | Checks if a string value is greater or equal to another. | **done** |
| **GreaterThanDateTime** | Checks if a datetime value is greater than another. | **done** |
| **GreaterThanDouble** | Checks if a double value is greater than another. | **done** |
| **GreaterThanInt** | Checks if a int value is greater than another. | **done** |
| **GreaterThanNumber** | Checks if a number value is greater than another. | **done** |
| **GreaterThanString** | Checks if a string value is greater than another. | **done** |
| **ImageSize** | Checks if the image width and height. | **done** |
| **InText** | Checks if the text is contained into another text. | **done** |
| **MembershipPassword** | Checks if the password has a good format according to the settings. | **done** |
| **MultiSelect** | Checks if value is a selection of items contained into a list of items. | **done** |
| **NbValues** | Checks if a array value has a valid length. | **done** |
| **NotEqualToDateTime** | Checks if a datetime value is not equal to another. | **done** |
| **NotEqualToDouble** | Checks if a double value is not equal to another. | **done** |
| **NotEqualToInt** | Checks if a int value is not equal to another. | **done** |
| **NotEqualToNumber** | Checks if a number value is not equal to another. | **done** |
| **NotEqualToString** | Checks if a string value is not equal to another. | **done** |
| **RangeOfDateTime** | Checks if a datetime value is between min and max values. | **done** |
| **RangeOfDouble** | Checks if a double value is between min and max values. | **done** |
| **RangeOfInt** | Checks if a int value is between min and max values. | **done** |
| **RangeOfNumber** | Checks if a number value is between min and max values. | **done** |
| **RangeOfString** | Checks if a string value is between min and max values. | **done** |
| **RegularExpression** | Checks if a value has a good format according to a regular expression. | **done** |
| **SingleSelect** | Checks if value is an item contained into a list of items. | **done** |
| **SmallerOrEqualToDateTime** | Checks if a datetime value is smaller or equal to another. | **done** |
| **SmallerOrEqualToDouble** | Checks if a double value is smaller or equal to another. | **done** |
| **SmallerOrEqualToInt** | Checks if a int value is smaller or equal to another. | **done** |
| **SmallerOrEqualToNumber** | Checks if a number value is smaller or equal to another. | **done** |
| **SmallerThanString** | Checks if a string value is smaller or equal to another. | **done** |
| **SmallerThanDateTime** | Checks if a datetime value is smaller than another. | **done** |
| **SmallerThanDouble** | Checks if a double value is smaller than another. | **done** |
| **SmallerThanInt** | Checks if a int value is smaller than another. | **done** |
| **SmallerThanNumber** | Checks if a number value is smaller than another. | **done** |
| **SmallerThanString** | Checks if a string value is smaller than another. | **done** |
| **StringLength** | Checks if a string value is a valid length. | **done** |
| **Url** | Checks if a value has a good URL format.. | **done** |

How can we add validators to a form element ?

You can add these functions to FormGroup, FormArray and FormControls.

These three classes has a **validators** property.

So, let see how to do this.

```dart
ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
  group: new FormGroup(
    controls: {
      'first_name': new FormControl<String>(
        value: 'Maxime',
        validators: [
          Required(error: 'first name is required'),
          StringLength(min: 3, max: 50, error: 'first name must have between 3 and 50 characters.')
        ],
      ),
      'last_name': new FormControl<String>(
        value: 'AUBRY',
        validators: [
          Required(error: 'last name is required'),
          StringLength(min: 3, max: 50, error: 'last name must have between 3 and 50 characters.')
        ],
      ),
    },
    validators: [],
  ),
);
```

Next time you will validate the form, these validators will be run.

Be careful, these validators will be run in this the order you will add them.

So, don't add StringLength validator before Required validator for example.

## Create validators

You easily can create you own validators.

Custom validators must override one of these three classes :
- **FormGroupValidatorAnnotation** for FormGroup validators.
- **FormArrayValidatorAnnotation** for FormArray validators.
- **FormControlValidatorAnnotation** for FormControl validators.
- **FormValidatorAnnotation** for validators that are common for these three form elements.

Here is a basic example for a FormGroup validator :

```dart
class CustomValidator extends FormGroupValidatorAnnotation {
  const CustomValidator({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(FormGroup control) async {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
```

Here is a basic example for a FormArray validator :

```dart
class CustomValidator extends FormArrayValidatorAnnotation {
  const CustomValidator({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(FormArray control) async {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
```

For FormControl validators, you must use generic type !

Here is a basic example for a FormControl validator :

```dart
class CustomValidator extends FormControlValidatorAnnotation<String> {
  const CustomValidator({
    @required String error,
  }) : super(error: error);

  @override
  Future<bool> isValid(FormControl<String> control) async {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
```

## Providers and Consumers

**flutter_forms** uses [Provider library] to provide and consume form elements into your widgets.

For almost each provider of **flutter_forms**, you can use **Consumers** (they are widgets), **watchers** and **readers**.

If you want to use **Consumers**, **watchers** or **readers**, data must be provided before.

Watchers are done to get form elements and rebuild widgets than use them when their value changes.

Readers are done to get form elements without rebuilding widgets than use them when their value changes.

Consumers can make reading difficult.

The last thing to know is **watchers** and **Consumers** do exactly the same thing.

## FormProvider

FormProvider is used inside **ReactiveForm** widget. Thanks to him, you are able to use **Consumers**, **watchers** and **readers** without defining it yourself.

Except if you need to go to a new route, you will must share elements with the new widget.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => new FormProvider(
      providers: [
        new FormGroupProvider.value(value: existingFormGroup),
      ],
      child: new Destination(),
    ),
  ),
);
```

## ReactiveFormStateProvider

ReactiveFormStateProvider is used inside **ReactiveForm** widget. Thanks to him, you are able to use **Consumers**, **watchers** and **readers** without defining it yourself.

ReactiveFormState watcher :

```dart
ReactiveFormState formState = context.watchFormState();
```

ReactiveFormState reader :

```dart
ReactiveFormState formState = context.readFormState();
```

ReactiveFormState consumer :

```dart
child: new ReactiveFormStateConsumer(
  builder: (context, formState, child) {
    return new Container();
  },
);
```

## FormGroupProvider

FormGroupProvider is used inside **ReactiveForm** widget. Thanks to him, you are able to use **Consumers**, **watchers** and **readers** without defining it yourself.

But, if you want to consume a sub form element, in the sub level of the root, you must provide it.

For example, here is a form. Root level is provided, thanks to **ReactiveForm** widget.

If we want to use **Consumers**, **watchers** or **readers** on a sub form element, use **FormGroupProvider.value** on it !

```dart
@override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        // here, we get the root level of the form builder.
        FormGroup root = context.watchFormGroup();

        // here, we provide the child FormGroup
        return new FormGroupProvider.value(
          value: root.getFormGroup('child'),
          builder: (context, _) {
            FormGroup child = context.watchFormGroup();

            return new Container();
          }
        );
      },
    );
  }
```

FormGroup watcher :

```dart
FormGroup formGroup = context.watchFormGroup();
```

FormGroup reader :

```dart
FormGroup formGroup = context.readFormGroup();
```

FormGroup consumer :

```dart
child: new FormGroupConsumer(
  builder: (context, formGroup, child) {
    return new Container();
  },
);
```

## FormArrayProvider

FormArray is always a sub form element of root level. If you want to consume it, you must provide it.

For example, here is a form. Root level is provided, thanks to **ReactiveForm** widget.

If we want to use **Consumers**, **watchers** or **readers** on a sub form element, use **FormArrayProvider.value** on it !

```dart
@override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        // here, we get the root level of the form builder.
        FormGroup root = context.watchFormGroup();

        // here, we provide the child FormArray
        return new FormArrayProvider.value(
          value: root.getFormArray('child'),
          builder: (context, _) {
            FormArray child = context.watchFormArray();

            return new Container();
          }
        );
      },
    );
  }
```

FormArray watcher :

```dart
FormArray formArray = context.watchFormArray();
```

FormArray reader :

```dart
FormArray formArray = context.readFormArray();
```

FormArray consumer :

```dart
child: new FormArrayConsumer(
  builder: (context, formArray, child) {
    return new Container();
  },
);
```

## FormControlProvider

FormControl is always a sub form element of root level. If you want to consume it, you must provide it.

For example, here is a form. Root level is provided, thanks to **ReactiveForm** widget.

If we want to use **Consumers**, **watchers** or **readers** on a sub form element, use **FormControlProvider.value** on it !

```dart
@override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        // here, we get the root level of the form builder.
        FormGroup root = context.watchFormGroup();

        // here, we provide the child FormControl
        return new FormControlProvider.value(
          value: root.getFormControl<String>('child'),
          builder: (context, _) {
            FormControl<String> child = context.watchFormControl<String>();

            return new Container();
          }
        );
      },
    );
  }
```

FormControl watcher :

```dart
FormControl<String> formControl = context.watchFormControl<String>();
```

FormControl reader :

```dart
FormControl<String> formControl = context.readFormControl<String>();
```

FormControl consumer :

```dart
child: new FormControlConsumer<String>(
  builder: (context, formControl, child) {
    return new Container();
  },
);
```

## MultipleStepFormStateIndexerProvider

MultipleStepFormStateIndexer is used only inside form with multiple steps.

Its role is to assemble all form state inside an indexer. So, **Stepper** will be able to target the good form state that you should use.

Use it when you want to validate a step :

```dart
@override
  Widget build(BuildContext context) {
    return new MultipleStepFormContainer(
        builder: (context, _) {
          return new Stepper(
            type: StepperType.horizontal,
            steps: this.steps,
            currentStep: currentStep,
            onStepContinue: () async {
              // here we get all steps names
              List<String> stepsNames =
                  context.readMultipleStepFormStateIndexer().keys.toList();
    
              // here we get the form state for the targeted step name
              ReactiveFormState formState = context.readFormState(
                step: stepsNames[currentStep],
              );
    
              // here we validate the current step
              if (await formState.validate()) {
                // Data treatment and post to server here...
              }
            },
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          );
        },
      );
  }
```

FormControl watcher :

```dart
MultipleStepFormStateIndexer indexer = context.watchMultipleStepFormStateIndexer();
```

FormControl reader :

```dart
MultipleStepFormStateIndexer indexer = context.readMultipleStepFormStateIndexer();
```

## See more examples

I invite you to study [example project].
Example project uses libraries :
- [date_time_picker].
- [file_picker].
- [flutter_slidable].
- [smart_select].

[Flutter]: https://flutter.dev/
[Provider library]: https://github.com/rrousselGit/provider
[example project]: https://github.com/maxime-aubry/flutter_forms/tree/main/example
[date_time_picker]: https://pub.dev/packages/date_time_picker
[file_picker]: https://pub.dev/packages/file_picker
[flutter_slidable]: https://pub.dev/packages/flutter_slidable
[smart_select]: https://pub.dev/packages/smart_select
