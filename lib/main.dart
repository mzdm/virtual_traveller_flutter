import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: Container(
        color: Colors.red,
        child: Text('Flutter Demo'),
      ),
    );
  }
}
