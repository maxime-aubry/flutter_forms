import 'package:flutter/material.dart';
import 'package:flutter_forms/flutter_forms.dart';

class CustomTextInput extends StatefulWidget {
  final String label;
  final FormControl<String> formControl;

  const CustomTextInput({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) => new TextFormField(
        decoration: InputDecoration(labelText: widget.label),
        keyboardType: TextInputType.text,
        controller: new TextEditingController(text: widget.formControl.value),
        onChanged: (String value) async =>
            await widget.formControl.setValue(value),
        onSaved: (String value) async =>
            await widget.formControl.setValue(value),
        validator: (String value) => widget.formControl.error?.message,
      );
}
