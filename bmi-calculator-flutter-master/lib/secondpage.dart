import 'reusableWidget.dart';
import 'package:bmi_calculator/reusableWidget.dart';
import 'package:flutter/material.dart';

class Secondpg extends StatelessWidget {
  final String bmires;
  final String res;
  Secondpg({@required this.bmires, @required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,

                ///adding alignment to container
                child: Text(
                  'Your result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReuseableContainer(
                  colour: Color(0xFF1D1E33),
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        res,
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF24D876),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmires,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: BottomButton(
              text: 'RECALCULATE',
              ontap: () {
                Navigator.pop(context);
              },
            ))
          ],
        ),
      ),
    );
  }
}
