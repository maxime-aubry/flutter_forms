import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );

  // static void showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));

  //   // Find the Scaffold in the widget tree and use
  //   // it to show a SnackBar.
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }
}
