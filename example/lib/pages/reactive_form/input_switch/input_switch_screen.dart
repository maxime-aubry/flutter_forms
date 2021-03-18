import 'package:example/custom_drawer.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';

class InputSwitch extends StatefulWidget {
  static const String routeName = '/inputSwitch';

  @override
  _InputSwitchState createState() => _InputSwitchState();
}

class _InputSwitchState extends State<InputSwitch> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();

        return new Scaffold(
          appBar: new AppBar(title: Text("Input switch")),
          drawer: new CustomDrawer(),
          body: new Padding(
            padding: EdgeInsets.all(5.0),
            child: new CustomSwitchInput(
              label: 'input',
              formControl: root.getFormControl<bool>('field'),
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
            'field': new FormControl<bool>(value: null, validators: []),
          },
          validators: [],
        ),
      );
}
