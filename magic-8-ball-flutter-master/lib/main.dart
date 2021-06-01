import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: Text(
          'Magic 8 Ball',
        ),
        backgroundColor: Colors.green[900],
      ),
      body: magicBall(),
    ),
  ));
}

class magicBall extends StatefulWidget {
  @override
  _magicBallState createState() => _magicBallState();
}

class _magicBallState extends State<magicBall> {
  @override
  int no = 1;
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Expanded(
          child: TextButton(
              onPressed: () {
                setState(() {
                  no = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset('images/ball$no.png')),
        ),
      ),
    );
  }
}
