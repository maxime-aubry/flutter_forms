import 'dart:typed_data';

import 'package:example/custom_drawer.dart';
import 'package:example/widgets/alert.dart';
import 'package:example/widgets/custom_file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';

class InputFile extends StatefulWidget {
  static const String routeName = '/inputFile';

  @override
  _InputFileState createState() => _InputFileState();
}

class _InputFileState extends State<InputFile> {
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formBuilder: this._getFormBuilder(),
      builder: (context, _) {
        FormGroup root = context.watchFormGroup();
        FormControl<Uint8List> formControl =
            root.getFormControl<Uint8List>('field');

        return new Scaffold(
          appBar: new AppBar(title: Text("Input file")),
          drawer: new CustomDrawer(),
          body: new Padding(
            padding: EdgeInsets.all(5.0),
            child: this.getInput(formControl),
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
            'field': new FormControl<Uint8List>(
              value: null,
              validators: [
                FileMimeType(
                  mimeTypes: ['image/jpeg'],
                  error: 'invalid file',
                ),
              ],
            ),
          },
          validators: [],
        ),
      );

  Widget getInput(FormControl<Uint8List> formControl) => new CustomFilePicker(
        label: 'input',
        formControl: formControl,
      );
}
