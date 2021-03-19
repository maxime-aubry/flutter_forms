[English](https://github.com/maxime-aubry/flutter_forms/blob/main/README.md) |
[Français](https://github.com/maxime-aubry/flutter_forms/blob/main/resources/translations/fr_FR/README.md)

[![Run tests](https://github.com/maxime-aubry/flutter_forms/actions/workflows/build_and_test.yaml/badge.svg?branch=main&event=push)](https://github.com/maxime-aubry/flutter_forms/actions/workflows/build_and_test.yaml)
![GitHub](https://img.shields.io/github/license/maxime-aubry/flutter_forms)
![GitHub top language](https://img.shields.io/github/languages/top/maxime-aubry/flutter_forms)
![Pub Version](https://img.shields.io/pub/v/flutter_forms)
![collection version](https://img.shields.io/badge/collection-1.15.0-brightgreen)
![constant_datetime version](https://img.shields.io/badge/constant_datetime-1.0.0-brightgreen)
![image version](https://img.shields.io/badge/image-3.0.1-brightgreen)
![mime version](https://img.shields.io/badge/mime-1.0.0-brightgreen)
![provider version](https://img.shields.io/badge/provider-5.0.0-brightgreen)
![queries version](https://img.shields.io/badge/queries-0.1.14-brightgreen)
![reflectable version](https://img.shields.io/badge/reflectable-3.0.0-brightgreen)

<a href="https://www.buymeacoffee.com/maxime.aubry" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" width="195" height="55" /></a>

Comme avec **Angular**, les formulaires réactifs sont désormais disponibles avec [Flutter] !

En utilisant **flutter_forms**, vous serez capable de simplifier votre code et la validation de vos formulaires.

## Sommaire

- [Commencement](#commencement)
    - [Prérequis](#prérequis)
    - [Dépendances](#dépendances)
- [FormBuilder](#formbuilder)
    - [FormGroup](#formgroup)
        - [Ajouter un contrôle à un FormGroup](#ajouter-un-contrôle-à-un-formgroup)
        - [Supprimer un contrôle d'un FormGroup](#supprimer-un-contrôle-dun-formgroup)
        - [Vérifier si un contrôle existe dans un FormGroup](#vérifier-si-un-contrôle-existe-dans-un-formgroup)
        - [Obtenir un sous-FormGroup](#obtenir-un-sous-formgroup)
        - [Obtenir un sous-FormArray](#obtenir-un-sous-formarray)
        - [Obtenir un sous-FormControl](#obtenir-un-sous-formcontrol)
    - [FormArray](#formarray)
        - [Ajouter un item à un FormArray](#ajouter-un-item-à-un-formarray)
        - [Supprimer un item d'un FormArray](#supprimer-un-item-dun-formarray)
    - [FormControl](#formcontrol)
        - [Attribuer une valeur](#attribuer-une-valeur)
    - [Cloner un élément de formulaire](#cloner-un-élément-de-formulaire)
- [Comment ajouter un formulaire réactif dans une application?](#comment-ajouter-un-formulaire-réactif-dans-une-application)
    - [Définir un fichier de model](#définir-un-fichier-de-model)
    - [Initialiser la librarie](#initialiser-la-librarie)
    - [Définir un formulaire basique](#définir-un-formulaire-basique)
    - [Ajouter des champs de saisie](#ajouter-des-champs-de-saisie)
- [Comment ajouter un formulaire réactif avec de multiple étapes dans une application?](#comment-ajouter-un-formulaire-réactif-avec-de-multiple-étapes-dans-une-application)
- [À propos des validateurs](#à-propos-des-validateurs)
    - [Ajouter des validateurs](#ajouter-des-validateurs)
    - [Créer des validateurs](#créer-des-validateurs)
- [Providers et Consumers](#providers-et-consumers)
    - [FormProvider](#formprovider)
    - [ReactiveFormStateProvider](#reactiveformstateprovider)
    - [FormGroupProvider](#formgroupprovider)
    - [FormArrayProvider](#formarrayprovider)
    - [FormControlProvider](#formcontrolprovider)
    - [MultipleStepFormStateIndexerProvider](#multiplestepformstateindexerprovider)
- [Voir plus d'exemples](#voir-plus-dexemples)

## Commencement

**flutter_forms** est vraiment simple à utiliser. Tout d'abord, vous devriez apprendre à utiliser **Flutter**.

S'il vous plait, veuillez lire [la documentation en ligne](https://flutter.dev/docs) avant d'utiliser cette librairie.

Vous trouvez des tutoriels, des code labs, des projets de démonstration... Tout ce dont vous aurez besoin pour être autonome.

## Prérequis

- Dart SDK: >=2.7.0 <3.0.0
- Flutter: >= 1.17.0

## Dépendances

Vous devez installer toutes ces dépendances pour utiliser **flutter_forms** :

``` dart
dependencies:
  flutter:
    sdk: flutter

  build_runner: any
  reflectable: ^2.2.9
  flutter_forms: ^1.0.0
```

Ensuite, lancez la commande **flutter packages get** dans la console.

## FormBuilder

**flutter_forms** est inspiré par les formulaires réactids d'Angular.

Bien sur, FormBuilder est le point de départ de la création de formulaire.

Comment créer un formulaire :

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

Un formulaire est créé et automatiquement instancié quand vous l'ajoutez au widget **ReactiveForm**. Il fournit un arborescence complète des éléments à utiliser.

> C'est une version simplifiée de **Angular reactive forms**.
> Comme pour **Angular reactive forms**, **flutter_forms** peut créer des formulaires dynamiques.
> Voyons tous ces points ensemble !

## FormGroup

Tout d'abord vous avez les **FormGroup**. Celui-ci est un rassemblement de **FormGroup**, **FormArray** et **FormControl**.

Vous devez les utiliser pour des formulaires complexes, avec de multiples niveaux.

Imaginez que vous devez renseigner votre profil. Vous pourriez avoir deux parties distinctes dans ce formulaire.

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

## Ajouter un contrôle à un FormGroup

Comment ajouter une partie sous-jacente de votre formulaire dynamiquement ?

Comment ajouter un **FormGroup** dans une collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormGroup child = new FormGroup(controls: {}, validators: []);
root.addControl('child', child);
```

Comment ajouter un **FormArray** dans une collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormArray child = new FormArray(groups: [], validators: []);
root.addControl('child', child);
```

Comment ajouter un **FormControl** dans une collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
FormControl<String> child = new FormControl<String>(value: null, validators: []);
root.addControl('child', child);
```

## Supprimer un contrôle d'un FormGroup

Comment supprimer un **FormGroup** de la collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.

Comment supprimer un **FormArray** de la collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormArray(groups: [], validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.

Comment supprimer un **FormControl** de la collection enfant d'un **FormGroup** :

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
root.removeControl('child');
```

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.

## Vérifier si un contrôle existe dans un FormGroup

Comment vérifier si un control existe dans un **FormGroup** ?

```dart
FormGroup root = new FormGroup(controls: {}, validators: []);
bool exists = root.containsControl('child');
```

## Obtenir un sous-FormGroup

Comment obtenir un **FormGroup** enfant ?

**NE FAITES PAS ÇA !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
FormGroup child = root.controls['child'] as FormGroup;
```

**FAITES ÇA !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormGroup(controls: {}, validators: []),
  },
  validators: [],
);
FormGroup child = root.getFormGroup('child');
```

## Obtenir un sous-FormArray

Comment obtenir un **FormArray** enfant ?

**NE FAITES PAS ÇA !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
FormControl<String> child = root.controls['child'] as FormControl<String>;
```

**FAITES ÇA !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormControl<String>(value: null, validators: []),
  },
  validators: [],
);
FormControl<String> child = root.getFormControl<String>('child');
```

## Obtenir un sous-FormControl

Comment obtenir un **FormControl** enfant ?

**NE FAITES PAS ÇA !**

```dart
FormGroup root = new FormGroup(
  controls: {
    'child': new FormArray(groups: [], validators: []),
  },
  validators: [],
);
FormArray child = root.controls['child'] as FormArray;
```

**FAITES ÇA !**

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

Ensuite vous avez le **FormArray**. Celui-ci est une collection de **FormGroup** uniquement.

C'est une différence avec la librairie d'**Angular**. Je ne suis pas d'accord avec le fait qu'un **FormArray** puisse détenir directement des items de **FormControl**.

Selon moi, **FormArray** d'Angular est trop permissif. Un développeur pourrait essayer d'ajouter des items de **FormGroup** et **FormControl** dans le même **FormArray**.

Ça ne devrait pas être possible, même si une exception était levée par la suite.

Comment déclarer un **FormArray** :

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

> Comment vous pouvez le voir, vous pouvez enregistrer des données complexes dans les items d'un **FormArray**.

## Ajouter un item à un FormArray

Ajouter un item à un **FormArray** est facile.

Souvenez-vous que vous pouvez ajouter des items de **FormGroup** uniquement.

Comment ajouter un item :

```dart
FormArray array = new FormArray(groups: [], validators: []);
FormGroup child = new FormGroup(controls: {}, validators: []);
array.addGroup(child);
```

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.

## Supprimer un item d'un FormArray

Comment supprimer un item :

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

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.
> Cette partiel est un peu confuse car vous n'avez pas encore vu comment obtenir un item à partir d'un form array. Voyons ça ensemble.

## FormControl

Que serait un formulaire si nous n'utilisions pas **FormControl** ?

Comment stocker des données, tandis que **FormGroup** et **FormArray** sont utilisés pour la structure !

**FormControl** sont prévus pour supporter une liste limitée de types de données :
- **DateTime**.
- **num** (Number).
- **int**.
- **double**.
- **String**.
- **bool**.
- Liste de **DateTime**.
- Liste de **num**.
- Liste de **int**.
- Liste de **double**.
- Liste de **String**.
- Liste def **bool**.
- **Uint8List**, **Uint16List**, **Uint32List**, **Uint64List**, **Int8List**, **Int16List**, **Int32List** and **Int64List** (for **buffer arrays**).
- **enums**.
- Liste d'**enums**.

Si vous essayez d'utiliser un type non autorisé, une exception sera levée.

Cette liste pourrait évoluer plus tard.

Comment déclarer un **FormControl** avec un type générique String :

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

## Attribuer une valeur

Comment attribuer une valeur à un **FormControl** :

```dart
FormControl<String> control = new FormControl<String>(value: null, validators: []);
control.setValue('my value');
```

> Cette méthode déclenchera le processus de validation et mettra à jour le formulaire pour afficher des erreurs s'il y en a.

## Cloner un élément de formulaire

Cloner un élément de formulaire is a very important point of **flutter_forms**.

Imaginez que vous modifiez un item de votre formulaire, tel qu'un sous **FormGroup**. Vous changez les valeurs, et vous décidez de cliquer sur le bouton d'annulation.

Un retour en arrières sur vos valeurs pourrait être un peu compliqué !

Donc, vous devriez cloner la partie du formulaire que vous souhaitez mettre à jour, et appliquer les changements plus tard si vous voulez.

Quand vous clonez un élément de formulaire, vous clonez l'arborescence complète d'un **ReactiveFormBuilder**, donc vous pouvez utiliser les validateurs pour comparer une valeur avec une autre.

Voici un exemple :

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

> Que ce soit pour **FormGroup**, **FormArray** ou **FormControl**, vous pouvez utiliser la même méthode **getClone()**.

## Comment ajouter un formulaire réactif dans une application?

Maintenant que nous avons étudié les bases de **flutter_forms**, voyons comment créer un formulaire dans une application [Flutter].

## Définir un fichier de model

Tout d'abord, vous devriez définir un fichier de model.

Celui-ci contriendra tous les enums, si vous voulez en utiliser.

Dans le fichier **./lib/models.dart**, voici les différentes étapes que nous ferons :
- définir un namespace pour les models.
- importer **flutter_forms**.
- définir une méthode **main()** (pour reflectable).
- définir vos enums.

Si vous ne définissez pas vos enums ici, ils seront refusés plus tard avec le **FormControl**. Une excepiton sera levée.

Veuillez utiliser la notation **@flutterFormsValidator** pour déclarer un contenu.

```dart
@flutterFormsValidator
library example.models;

import 'package:flutter_forms/flutter_forms.dart';

void main() {}

@flutterFormsValidator
enum EGender { male, female }
```

Utilisez cette ligne de commande pour obtenir un nouveau fichier nommé **models.reflectable.dart** dans un projet d'application **Flutter**.

```console
> flutter pub run build_runner build
```

## Initialiser la librarie

Ensuite, dans le fichier **main.dart**, vous devez initialiser le namespace à importer.

Ici, vous importez **example.models** à partir de **./lib/models.reflectable.dart**.

```dart
import 'package:example/models.reflectable.dart';
import 'package:flutter_forms/flutter_forms.dart';

void main() {
  initializeReflectable();
  LibraryInitializer.initialize(libraryName: 'example.models');
  runApp(new MyApp());
}
```

## Définir un formulaire basique

Nous y sommes. Nous allons définir nous nouveau formulaire.

Dans votre **widget**, commencez par définir un object [ReactiveForm].


La propriété [formBuilder] reçoit le **ReactiveFormBuilder**.

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

Nous venons juste de créer un nouveau formulaire avec deux champs de saisie, **first_name** et **last_name**.

## Ajouter des champs de saisie

Ensuite, ajoutons des champs de saisie à afficher sur notre écran.

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

## Comment ajouter un formulaire réactif avec de multiple étapes dans une application?

**flutter_forms** supporte les formulaires avec de multiples étapes !

Vous devez ajouter des formulaires dans un contaneur qui assemblera tous les **ReactiveFormState**.

Voyons un exemple :

Voici la page principale :

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

Voici une étape :

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

Voici une autre étape :

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

## À propos des validateurs

Que serait cette librarie sans les validateurs ? RIEN !

## Ajouter des validateurs

Donc, voici une liste des validateurs disponibles :

Communs :

| Validateur | Description  | Progression |
| ----- | ----- | ----- |
| **Required** | Validez un FormGroup, FormArray et FormControl. Vérifie si un FormGroup n'est pas null et contient des contrôles. Vérifie si un FormArray n'est pas null et contient des éléments. Vérifie si un FormControl n'est pas null. Si celui-ci est une chaîne de caractères, vérifie si ce n'est pas une chaîne de caractères vide. | **fait** |

FormGroup :

> Il n'y a pas de validateurs FormGroup pour le moment.

FormArray :

| Validateur | Description  | Progression |
| ----- | ----- | ----- |
| **NbItems** | Vérifie si un FormArray has a valid length. | **fait** |

FormControls :

| Validateur | Description  | Progression |
| ----- | ----- | ----- |
| **Email** | Checks if a string value is a valid email. | **done** |
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
| **ImageSize** | Checks if the image width and height are valid. | **done** |
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

Comment pouvons-nous ajouter des validateurs à un élément de formulaire ?

Vous pouvez ajouter cette méthodes à un **FormGroup**, **FormArray** ou **FormControls**.

Ces trois classes ont une propriété **validators**.

Donc, voyons comment faire ça.

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

La prochaine fois que vous validerez le formulaire, ces validateurs seront exécutés.

Attention, ces validateurs seront exécutés dans l'ordre dans lequel vous les ajouterez.

Donc, n'ajoutez pas le validateur **StringLength** avant le validateur **Required** par exemple.

## Créer des validateurs

Vous pouvez facilement créer vos propres validateurs.

Les validateurs personnalisés devront surcharger l'une de ces quatre classes:
- **FormGroupValidatorAnnotation** pour les validateurs FormGroup.
- **FormArrayValidatorAnnotation** pour les validateurs FormArray.
- **FormControlValidatorAnnotation** pour les validateurs FormControl.
- **FormValidatorAnnotation** pour les validateurs communs à ces trois éléments de formulaire.

Voici un exemple basique pour un validateur **FormGroup** :

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

Voici un exemple basique pour un validateur **FormArray** :

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

Pour les validateurs de **FormControl**, vous devez utilsier un type générique !

Voici un exemple basique pour un validateur **FormControl** :

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

## Providers et Consumers

**flutter_forms** utilise [la librairie Provider] pour fournir et consumer des éléments de formulaire à vos **widgets**.

Pour presque tous les providers de **flutter_forms**, vous pouvez utiliser les **Consumers** (qui sont des **widgets**), les **watchers** et les **readers**.

Si vous voulez utiliser les **Consumers**, **watchers** ou **readers**, les données doivent être fournies avant.

Les **Watchers** sont faits pour obtenir des éléments de formulaire et rebuilder les **widgets** qui les utilisent quand leur valeur change.

Les **Readers** sont faits pour obtenir des éléments de formulaire sans rebuilder les **widgets** qui les utilisent quand leur valeur change.

Les **Consumers** peuvent rendre la lecture du code plus difficile.

La dernière chose à savoir est que les **watchers** et le **Consumers** font exactement la même chose.

## FormProvider

**ReactiveFormProvider** est utilisé dans **ReactiveForm** **widget**. Grâce à lui, vous pouvez utiliser des **Consumers**, des **Watchers** et des **Readers** sans le définir vous-même.

Excepté si vous naviguez vers une nouvelle route, vous devrez partager ces éléments avec le nouveau **widget**.

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

**ReactiveFormStateProvider** est utilisé dans le widget **ReactiveForm**. Grâce à lui, vous pouvez utiliser des **Consumers**, des **Watchers** et des **Readers** sans le définir vous-même.

**ReactiveFormState watcher** :

```dart
ReactiveFormState formState = context.watchFormState();
```

**ReactiveFormState reader** :

```dart
ReactiveFormState formState = context.readFormState();
```

**ReactiveFormState consumer** :

```dart
child: new ReactiveFormStateConsumer(
  builder: (context, formState, child) {
    return new Container();
  },
);
```

## FormGroupProvider

**FormGroupProvider** est utilisé dans le **widget** **ReactiveForm**. Grâce à lui, vous pouvez utiliser des **Consumers**, des **Watchers** et des **Readers** sans le définir vous-même.

Mais, si vous souhaitez consommer un élément de sous-formulaire, dans le sous-niveau de la racine, vous devez le fournir.

Par exemple, voici un formulaire. Le niveau **root** est fourni, grâce au **widget** **ReactiveForm**.

Si nous voulons utiliser **Consumers**, **Watchers** ou **Readers** sur un élément de sous-formulaire, utilisez **FormGroupProvider.value** dessus !

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

**FormGroup watcher** :

```dart
FormGroup formGroup = context.watchFormGroup();
```

**FormGroup reader** :

```dart
FormGroup formGroup = context.readFormGroup();
```

**FormGroup consumer** :

```dart
child: new FormGroupConsumer(
  builder: (context, formGroup, child) {
    return new Container();
  },
);
```

## FormArrayProvider

**FormArray** est toujours un élément de sous-formulaire de niveau **root**. Si vous souhaitez le consommer, vous devez le fournir.

Par exemple, voici un formulaire. Le niveau **root** est fourni, grâce au **widget** **ReactiveForm **.

Si nous voulons utiliser **Consumers**, **Watchers** ou **Readers** sur un élément de sous-formulaire, utilisez **FormArrayProvider.value** dessus !

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

**FormArray watcher** :

```dart
FormArray formArray = context.watchFormArray();
```

**FormArray reader** :

```dart
FormArray formArray = context.readFormArray();
```

**FormArray consumer** :

```dart
child: new FormArrayConsumer(
  builder: (context, formArray, child) {
    return new Container();
  },
);
```

## FormControlProvider

**FormControl** est toujours un élément de sous-formulaire de niveau **root**. Si vous souhaitez le consommer, vous devez le fournir.

Par exemple, voici un formulaire. Le niveau **root** est fourni, grâce au **widget** **ReactiveForm**.

Si nous voulons utiliser **Consumers**, **Watchers * ou **Readers** sur un élément de sous-formulaire, utilisez **FormControlProvider.value** dessus !

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

**FormControl watcher** :

```dart
FormControl<String> formControl = context.watchFormControl<String>();
```

**FormControl reader** :

```dart
FormControl<String> formControl = context.readFormControl<String>();
```

**FormControl consumer** :

```dart
child: new FormControlConsumer<String>(
  builder: (context, formControl, child) {
    return new Container();
  },
);
```

## MultipleStepFormStateIndexerProvider

**MultipleStepFormStateIndexer** est utilisé uniquement à l'intérieur d'un formulaire avec de multiples étapes.

Son rôle est d'assembler tous les états de formulaire dans un indexeur. Ainsi, **Stepper** pourra cibler le bon état de forme que vous devez utiliser.

Utilisez-le lorsque vous souhaitez valider une étape:

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

**FormControl watcher** :

```dart
MultipleStepFormStateIndexer indexer = context.watchMultipleStepFormStateIndexer();
```

**FormControl reader** :

```dart
MultipleStepFormStateIndexer indexer = context.readMultipleStepFormStateIndexer();
```

## Voir plus d'exemples

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
