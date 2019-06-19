import 'package:flutter/material.dart';
import 'package:helloworld/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMyCar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new NavigationPage()
    );
  }
}