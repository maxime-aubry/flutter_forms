import 'package:example/routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  Widget createDrawerBodyItem({
    String text,
    GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Text(
          text,
          style: new TextStyle(
            fontSize: onTap == null ? 12 : 14,
            color: onTap == null ? Colors.grey : Colors.black,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text('Examples')),
          createDrawerBodyItem(
            text: 'Reactive form',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveForm,
            ),
          ),
          createDrawerBodyItem(
            text: 'Reactive form with dynamic content',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveFormWithDynamicContent,
            ),
          ),
          createDrawerBodyItem(
            text: 'Reactive form with form array',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveFormWithFormArray,
            ),
          ),
          createDrawerBodyItem(
            text: 'Reactive multiple steps form',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.reactiveMultipleStepsForm,
            ),
          ),
          new Divider(),
          createDrawerBodyItem(
            text: 'Inputs :',
            onTap: null,
          ),
          createDrawerBodyItem(
            text: 'DateTime',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.inputDateTime,
            ),
          ),
          createDrawerBodyItem(
            text: 'Number (double, int, num)',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.inputNumber,
            ),
          ),
          createDrawerBodyItem(
            text: 'Text',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.inputText,
            ),
          ),
          createDrawerBodyItem(
            text: 'File (image for example)',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.inputFile,
            ),
          ),
          createDrawerBodyItem(
            text: 'Dropdown',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.dropdown,
            ),
          ),
          createDrawerBodyItem(
            text: 'Switch',
            onTap: () => Navigator.pushReplacementNamed(
              context,
              pageRoutes.inputSwitch,
            ),
          ),
        ],
      ),
    );
  }
}
