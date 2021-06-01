import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Brain obj = Brain();
void main(List<String> args) {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Do Quiz ')),
          backgroundColor: Colors.teal[800],
        ),
        backgroundColor: Colors.green[200],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Quizpg(),
          ),
        ),
      ),
    );
  }
}

class Quizpg extends StatefulWidget {
  @override
  _QuizpgState createState() => _QuizpgState();
}

class _QuizpgState extends State<Quizpg> {
  @override
  List<Icon> score = [];

  void check(bool userinput) {
    setState(() {
      if (obj.isFinished() == false) {
        Alert(context: context, title: "Quiz Over", desc: "From start").show();
        obj.reset();
        score.clear();
      } else {
        obj.nextQues();
        if (obj.ansFunction() == userinput) {
          print('right ans');
          score.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          print('wrong');
          score.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              obj.questionFunction(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            check(true);
          },
          child: Text('True'),
          color: Colors.green[500],
          textColor: Colors.white,
        ),
        FlatButton(
          onPressed: () {
            check(false);
          },
          child: Text('False'),
          color: Colors.red[500],
          textColor: Colors.white,
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
