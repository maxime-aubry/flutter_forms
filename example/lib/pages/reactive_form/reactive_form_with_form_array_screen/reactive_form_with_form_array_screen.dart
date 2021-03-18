import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/pages/reactive_form/common/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class ReactiveFormWithFormArrayScreen extends StatefulWidget {
  static const String routeName = '/reactiveFormWithFormArray';

  @override
  _ReactiveFormWithFormArrayScreenState createState() =>
      _ReactiveFormWithFormArrayScreenState();
}

class _ReactiveFormWithFormArrayScreenState
    extends State<ReactiveFormWithFormArrayScreen> {
  List<S2Choice<EGender>> genders = [];

  @override
  void initState() {
    ListItemsProvider.clear();

    ListItemsProvider.register<EGender>(
      'getListOfGenders',
      () async => [
        new SelectListItem<EGender>(EGender.male, 'male'),
        new SelectListItem<EGender>(EGender.female, 'female'),
      ],
    );

    ListItemsProvider.register<ESocialNetwork>(
      'getListOfSocialNetwork',
      () async => [
        new SelectListItem<ESocialNetwork>(ESocialNetwork.facebook, 'Facebook'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.github, 'Github'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.pub, 'Pub.dev'),
        new SelectListItem<ESocialNetwork>(ESocialNetwork.twitter, 'Twitter'),
      ],
    );

    () async {
      this.genders.addAll(
            Collection(
              await ListItemsProvider.provide<EGender>('getListOfGenders')(),
            )
                .select((arg1) => S2Choice(value: arg1.value, title: arg1.text))
                .toList(),
          );
    }();

    super.initState();
  }

  @override
  void dispose() {
    ListItemsProvider.close('getListOfGenders');
    ListItemsProvider.close('getListOfSocialNetwork');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Scaffold(
          appBar: new AppBar(title: Text("Reactive form with FormArray")),
          drawer: new CustomDrawer(),
          body: new SingleChildScrollView(
            child: new Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: new Column(
                children: [
                  this._firstnameInput(
                    root.getFormControl<String>('firstname'),
                  ),
                  this._lastnameInput(root.getFormControl<String>('lastname')),
                  this._genderInput(root.getFormControl<EGender>('gender')),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Text(
                        'Social links',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => this._goToAddPage(
                        root.getFormArray('social_links'),
                      ),
                      style: ButtonStyle(),
                      icon: Icon(Icons.add),
                      label: Text('Add'),
                    ),
                  ),
                  new FormArrayProvider.value(
                    value: root.getFormArray('social_links'),
                    builder: (context, __) {
                      FormArray socialLinks = context.watchFormArray();

                      if (socialLinks.status ==
                          EAbstractControlStatus.invalid) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: this._getErrorText(socialLinks.error?.message),
                        );
                      }

                      return new Container();
                    },
                  ),
                  new SocialLinksSlidable(),
                ],
              ),
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () async {
              ReactiveFormState formState = context.readFormState();
              if (await formState.validate()) {
                // Data treatment and post to server here...
                displayAlert(context, 'Form is valid !');
              } else {
                displayAlert(context, 'Form is invalid !');
              }
            },
          ),
        );
      },
    );
  }

  ReactiveFormBuilder _getFormBuilder() => new ReactiveFormBuilder(
        group: new FormGroup(
          controls: {
            'firstname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'firstname is required.')],
            ),
            'lastname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'lastname is required.')],
            ),
            'gender': new FormControl<EGender>(
              value: null,
              validators: [
                Required(error: 'gender is required.'),
                SingleSelect(
                  serviceName: 'getListOfGenders',
                  error: 'unknown gender.',
                )
              ],
            ),
            'social_links': new FormArray(
              groups: [],
              validators: [
                NbItems(
                  min: 1,
                  max: 3,
                  error: 'There must be between 1 and 3 items.',
                )
              ],
            ),
          },
          validators: [],
        ),
      );

  Widget _firstnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'firstname', formControl: formControl);

  Widget _lastnameInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'lastname', formControl: formControl);

  Widget _genderInput(FormControl<EGender> formControl) =>
      new CustomSingleDropdown<EGender>(
        label: 'gender',
        dataSource: this.genders,
        formControl: formControl,
      );

  Widget _getErrorText(String error) {
    Color errorColor = Colors.redAccent[700];

    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          error,
          style: new TextStyle(color: errorColor, fontSize: 12),
        ),
      ),
    );
  }

  void _goToAddPage(FormArray socialLinks) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new FormProvider(
            providers: [
              new FormArrayProvider.value(value: socialLinks),
            ],
            child: new AddSocialLink(),
          ),
        ),
      );
}
