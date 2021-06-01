import 'package:flutter/material.dart';
import 'screen0.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/0',
      routes: {
        '/1': (context) => Screen1(),
        '/0': (context) => Screen0(),
        '/2': (context) => Screen2(),
      },
    );
  }
}
