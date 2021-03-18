import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void displayAlert(BuildContext context, String message) {
  TextButton okButton = TextButton(
    child: Text('Ok'),
    onPressed: () => Navigator.of(context).pop(),
  );

  AlertDialog alertDialog = AlertDialog(
    title: Text('AlertDialog Title'),
    content: SingleChildScrollView(
      child: ListBody(
        children: [Text(message)],
      ),
    ),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => alertDialog,
  );
}
