import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_forms/flutter_forms.dart';

class CustomNumberInput extends StatefulWidget {
  final String label;
  final FormControl<double> formControl;

  const CustomNumberInput({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomNumberInputState createState() => _CustomNumberInputState();
}

class _CustomNumberInputState extends State<CustomNumberInput> {
  @override
  Widget build(BuildContext context) => new TextFormField(
        decoration: InputDecoration(labelText: widget.label),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
        ],
        controller: new TextEditingController(
          text: widget.formControl.value?.toString(),
        ),
        onChanged: (String value) async =>
            await widget.formControl.setValue(double.tryParse(value) ?? null),
        onSaved: (String value) async =>
            await widget.formControl.setValue(double.tryParse(value) ?? null),
        validator: (String value) => widget.formControl.error?.message,
      );
}
