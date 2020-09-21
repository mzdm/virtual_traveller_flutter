import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: Text('name'),
          ),
        ),
      ),
    );
  }
}
