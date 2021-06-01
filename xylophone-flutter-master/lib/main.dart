import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  void play(int n) {
    final player = AudioCache();
    player.play('note$n.wav');
  }

  Expanded createButton(int n, {Color color}) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            play(n);
          },
          color: color),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            createButton(1, color: Colors.red),
            createButton(2, color: Colors.orange),
            createButton(3, color: Colors.yellow),
            createButton(4, color: Colors.green),
            createButton(5, color: Colors.blue),
            createButton(6, color: Colors.indigo),
            createButton(7, color: Colors.deepPurple)
          ],
        ),
      ),
    ));
  }
}
