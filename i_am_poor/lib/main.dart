import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
          appBar: AppBar(
            home: Scaffold(
              backgroundColor: Colors.green[100],
            title: Center(
              child: Text("i am poor"),
            ),
            backgroundColor: Colors.green[700],
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/coal.jpg'),
            ),
          ),),
    ),
  );
}