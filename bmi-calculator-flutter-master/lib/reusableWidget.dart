import 'package:bmi_calculator/constants.dart';
/////////////////////////////////reuse classes
import 'package:flutter/material.dart';

class ReuseIcon extends StatelessWidget {
  final IconData newIcon;
  final String txt;
  ReuseIcon({@required this.newIcon, this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          newIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          txt,
          style: klabelTextStyle,
        )
      ],
    );
  }
}

class ReuseableContainer extends StatelessWidget {
  final Color colour;
  final Widget containerChild;
  final Function onPress;
  ReuseableContainer(
      {@required this.colour, this.containerChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: containerChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String text;
  BottomButton({this.text, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          color: Color(0xFFEB1555),
          margin: EdgeInsets.only(top: 10),
          height: 70,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          )),
    );
  }
}
