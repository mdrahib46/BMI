import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalc/Components/icon_content.dart';
import 'package:bmicalc/Components/reusable_card.dart';
import 'package:bmicalc/constants.dart';
import 'result_page.dart';
import 'package:bmicalc/Components/bottom_button.dart';
import 'package:bmicalc/Components/roundIcon_button.dart';
import 'package:bmicalc/calculator_brain.dart';

enum Gender {
  male,
  female,}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //  Color maleCardColor = inActiveCardColor;
  //  Color femaleCardColor = inActiveCardColor;
  //
  // void updateColor(Gender selectedGender){
  //
  // }
  // //  1 = male, 2 = female
  //   if (selectedGender == Gender.male){
  //     if (maleCardColor == inActiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inActiveCardColor;
  //     }
  //     else{
  //       maleCardColor = inActiveCardColor;
  //     }
  //   }
  //
  //   if (selectedGender == Gender.female){
  //     if (femaleCardColor == inActiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inActiveCardColor;
  //     }
  //     else{
  //       femaleCardColor = inActiveCardColor;
  //     }
  //   }
  // }

  Gender? selectedGenger;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
        // backgroundColor: Color(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGenger = Gender.male;
                      });
                    },
                    // Ternary operator has been used below
                    colour: selectedGenger == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      lebel: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGenger = Gender.female;
                      });
                    },
                    // Ternary operator has been used below
                    colour: selectedGenger == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      lebel: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //changed
          Expanded(
              child: ReUsableCard(
            colour: kInActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumTextStyle),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x1fEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xff999a9f),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                //changed
                Expanded(
                  child: ReUsableCard(
                    colour: kInActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.plus,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: kInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FaIcon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
              onTap: () {
                CalcuatorBrain calc =
                    CalcuatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(

                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interputation: calc.getInterputation(),
                    ),
                  ),
                );
              },
              buttonTitle: 'CALCULATE')
        ],
      ),
    );
  }
}
