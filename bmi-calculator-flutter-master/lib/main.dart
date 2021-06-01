import 'package:flutter/material.dart';
import 'first_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InputPage(),
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0D0F1E),
          scaffoldBackgroundColor: Color(0xFF0D0F1E),
        ));
  }
}
