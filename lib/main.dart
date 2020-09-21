import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Person('Fred', 20);

    return MaterialApp(
      title: 'MaterialApp',
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: Text(p.name),
          ),
        ),
      ),
    );
  }
}
