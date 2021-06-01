import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String t;
  final Function f;
  Button({this.color, this.t, @required this.f});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: f,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            t,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
