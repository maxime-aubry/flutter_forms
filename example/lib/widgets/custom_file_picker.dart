import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_forms/flutter_forms.dart';

class CustomFilePicker extends StatefulWidget {
  final String label;
  final FormControl<String> formControl;

  const CustomFilePicker({
    Key key,
    @required this.label,
    @required this.formControl,
  }) : super(key: key);

  @override
  _CustomFilePickerState createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  @override
  Widget build(BuildContext context) {
    return new TextButton.icon(
      onPressed: () async {
        FilePickerResult result = await FilePicker.platform.pickFiles();

        if (result != null) {
          List<File> files = result.paths.map((path) => File(path)).toList();
          print(files.length);
        }
      },
      icon: Icon(Icons.file_upload),
      label: Text(widget.label),
    );
  }
}
