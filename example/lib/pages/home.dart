import 'package:example/custom_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('flutter_forms demo')),
      drawer: CustomDrawer(),
      body: Center(child: Text('flutter_forms demo')),
    );
  }
}
