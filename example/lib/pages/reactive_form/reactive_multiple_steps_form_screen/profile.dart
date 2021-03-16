import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<S2Choice<EGender>> genders = [];

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    return new ReactiveForm(
      step: 'profile',
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: new Column(
            children: [
              this._firstnameInput(
                root.getFormControl<String>('firstname'),
              ),
              this._lastnameInput(root.getFormControl<String>('lastname')),
              this._genderInput(root.getFormControl<EGender>('gender')),
            ],
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
}
