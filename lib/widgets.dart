import 'package:flutter/material.dart';

import 'constants.dart';

//Column
class MyColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  const MyColumn({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: kMyTextStyle,
        ),
      ],
    );
  }
}

// My Box
class MyBox extends StatelessWidget {
  final Color colour;
  final Widget boxChild;
  final Function onTapped;
  const MyBox({Key key, @required this.colour, this.boxChild, this.onTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: boxChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

//Round Icon button

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  const RoundIconButton({Key key, @required this.icon, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kActiveColor,
    );
  }
}

//BottomButton
class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const BottomButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        height: 80.0,
        width: double.infinity,
        color: kBottomBoxColor,
      ),
    );
  }
}
