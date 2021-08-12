import 'dart:ui';

import 'package:bmi_calculator/screens/calculator.dart';
import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmiScreen.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyBox(
                    onTapped: () {
                      setState(
                        () {
                          selectedGender = Genders.male;
                        },
                      );
                    },
                    boxChild: MyColumn(
                      title: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    colour: selectedGender == Genders.male
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
                Expanded(
                  child: MyBox(
                    onTapped: () {
                      setState(
                        () {
                          selectedGender = Genders.female;
                        },
                      );
                    },
                    boxChild: MyColumn(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                    colour: selectedGender == Genders.female
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyBox(
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kMyTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kMyTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: kBottomBoxColor,
                    inactiveColor: kActiveColor,
                    min: 100,
                    max: 270,
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ],
              ),
              colour: kInactiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyBox(
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kMyTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kInactiveColor,
                  ),
                ),
                Expanded(
                  child: MyBox(
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kMyTextStyle,
                        ),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              print(calc.bmiCalculator());
              print(calc.result());
              print(calc.interpretation());
              print(calc.bmi);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultsPage(
                    result: calc.result(),
                    interpretation: calc.interpretation(),
                    calculated: calc.bmiCalculator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
