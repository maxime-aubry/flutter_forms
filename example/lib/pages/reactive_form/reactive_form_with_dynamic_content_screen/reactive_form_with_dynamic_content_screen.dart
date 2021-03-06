import 'package:example/custom_drawer.dart';
import 'package:example/models.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class ReactiveFormWithDynamicContentScreen extends StatefulWidget {
  static const String routeName = '/reactiveFormWithDynamicContent';

  @override
  _ReactiveFormWithDynamicContentState createState() =>
      _ReactiveFormWithDynamicContentState();
}

class _ReactiveFormWithDynamicContentState
    extends State<ReactiveFormWithDynamicContentScreen> {
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Scaffold(
          appBar: new AppBar(title: Text("Reactive form with dynamic content")),
          drawer: new CustomDrawer(),
          body: new Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: new Column(
              children: [
                new CustomTextInput(
                  label: 'firstname',
                  formControl: root.getFormControl<String>('firstname'),
                ),
                new CustomTextInput(
                  label: 'lastname',
                  formControl: root.getFormControl<String>('lastname'),
                ),
                new CustomSingleDropdown<EGender>(
                  label: 'gender',
                  dataSource: this.genders,
                  formControl: root.getFormControl<EGender>('gender'),
                ),
                new CustomSwitchInput(
                  label: 'share address',
                  formControl: root.getFormControl<bool>('share_address'),
                ),
                new _AddressFormGroup(),
              ],
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
              validators: [Required(error: 'firstname is required')],
            ),
            'lastname': new FormControl<String>(
              value: null,
              validators: [Required(error: 'lastname is required')],
            ),
            'gender': new FormControl<EGender>(
              value: null,
              validators: [
                Required(error: 'gender is required'),
                SingleSelect(
                  serviceName: 'getListOfGenders',
                  error: 'unknown gender.',
                ),
              ],
            ),
            'share_address': new FormControl<bool>(
              value: false,
              validators: [],
            ),
            'address': new FormGroup(
              controls: {},
              validators: [],
            ),
          },
          validators: [],
        ),
      );
}

class _AddressFormGroup extends StatefulWidget {
  @override
  _AddressFormGroupState createState() => _AddressFormGroupState();
}

class _AddressFormGroupState extends State<_AddressFormGroup> {
  @override
  Widget build(BuildContext context) {
    FormGroup root = context.watchFormGroup();

    return new FormControlProvider<bool>(
      create: (_) => root.getFormControl<bool>('share_address'),
      builder: (context, __) {
        FormGroup addressFormGroup = root.getFormGroup('address');
        FormControl<bool> share_address = context.watchFormControl<bool>();

        if (share_address.value) {
          this._enableAddress(addressFormGroup);

          return new Column(
            children: [
              this._streetInput(
                addressFormGroup.getFormControl<String>('street'),
              ),
              this._zipcodeInput(
                addressFormGroup.getFormControl<String>('zipcode'),
              ),
              this._countryInput(
                addressFormGroup.getFormControl<String>('country'),
              ),
            ],
          );
        }

        if (!share_address.value) {
          this._disableAddress(addressFormGroup);
          return new Column();
        }

        return new Column();
      },
    );
  }

  void _enableAddress(FormGroup address) {
    if (!address.containsControl('street') &&
        !address.containsControl('zipcode') &&
        !address.containsControl('country')) {
      address.addControl(
        'street',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'street is required')],
        ),
      );
      address.addControl(
        'zipcode',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'zip code is required')],
        ),
      );
      address.addControl(
        'country',
        new FormControl<String>(
          value: null,
          validators: [Required(error: 'country is required')],
        ),
      );
    }
  }

  void _disableAddress(FormGroup address) {
    if (address.containsControl('street') &&
        address.containsControl('zipcode') &&
        address.containsControl('country')) {
      address.removeControl('street');
      address.removeControl('zipcode');
      address.removeControl('country');
    }
  }

  Widget _streetInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'street', formControl: formControl);

  Widget _zipcodeInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'zip code', formControl: formControl);

  Widget _countryInput(FormControl<String> formControl) =>
      new CustomTextInput(label: 'country', formControl: formControl);
}
