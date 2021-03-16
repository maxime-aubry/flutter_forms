import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';

class CustomSwitchInput extends StatefulWidget {
  final String label;
  final FormControl<bool> formControl;

  const CustomSwitchInput({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitchInput> {
  @override
  Widget build(BuildContext context) => new FormControlProvider<bool>.value(
        value: widget.formControl,
        builder: (BuildContext context, Widget child) => new Row(
          children: [
            Expanded(
              child: Text(
                'display address ?',
                style: new TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
            Switch(
              value: context.watchFormControl<bool>().value,
              onChanged: (bool value) {
                FormControl<bool> formControl = context.readFormControl<bool>();
                formControl.setValue(value);
              },
            ),
          ],
        ),
      );
}
