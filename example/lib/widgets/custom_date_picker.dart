import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String label;
  final FormControl<DateTime> formControl;

  const CustomDatePicker({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'en_US';
  }

  @override
  Widget build(BuildContext context) {
    return new DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'yyyy/MM/dd',
      controller: new TextEditingController(
        text: widget.formControl.value.toString(),
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: widget.label,
      onChanged: (String value) async =>
          await widget.formControl.setValue(value.toDateTime()),
      onSaved: (String value) async =>
          await widget.formControl.setValue(value.toDateTime()),
      validator: (String value) => widget.formControl.error?.message,
    );
  }
}
