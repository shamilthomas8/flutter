import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableWidget.dart';
import 'constants.dart';
import 'secondpage.dart';
import 'calculate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
enum Prop { age, weight }

class _InputPageState extends State<InputPage> {
  Gender newGender;
  int height = 180;
  int weight = 30;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CALCULATOR'))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableContainer(
                    colour: newGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    containerChild:
                        ReuseIcon(newIcon: FontAwesomeIcons.mars, txt: 'Man'),
                    onPress: () {
                      setState(() {
                        newGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReuseableContainer(
                    colour: newGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    containerChild: ReuseIcon(
                        newIcon: FontAwesomeIcons.venus, txt: 'Woman'),
                    onPress: () {
                      setState(() {
                        newGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableContainer(
              colour: kactiveCardColor,
              containerChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: klabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,

                      /// to make 180 and cm in same line, shud add textBaseline property otherwise crashes
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kthickStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8B8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.round();
                          });
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableContainer(
                    colour: kactiveCardColor,
                    containerChild: buildColumn(Prop.weight),
                  ),
                ),
                Expanded(
                  child: ReuseableContainer(
                      colour: kactiveCardColor,
                      containerChild: buildColumn(Prop.age)),
                ),
              ],
            ),
          ),
          BottomButton(
              ontap: () {
                print(weight);
                print(height);
                CalculatorBrain cb =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Secondpg(
                            bmires: cb.bmi(),
                            res: cb.result()))); //give in order else error
              },
              text: 'CALCULATE'),
        ],
      ),
    );
  }

  ///////////////////remake col method

  Column buildColumn(Prop p) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          p == Prop.age ? "AGE" : "WEIGHT",
          style: klabelTextStyle,
        ),
        Text(
          p == Prop.age
              ? age.toString()
              : weight.toString(), //weight.toString(),
          style: kthickStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: p == Prop.age ? age.toString() : weight.toString(),
              onPressed: () {
                setState(
                  () {
                    p == Prop.age ? age-- : weight--;
                  },
                );
              },
              backgroundColor: Color(0xFF434353),
              child: Icon(
                FontAwesomeIcons.minus,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: p == Prop.age ? 'age2' : 'height3',

              ///without hero tag application does not navigate beacuse many floaing buttons are used
              onPressed: () {
                setState(
                  () {
                    p == Prop.age ? age++ : weight++;
                  },
                );
              },
              backgroundColor: Color(0xFF434353),
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
