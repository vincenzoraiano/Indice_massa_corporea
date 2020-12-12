import 'package:calcolo_indice/reusable_card.dart';

import 'bottom_button.dart';

import 'file:///C:/Flutter%20projects/Angela%20Wu/CalcoloMassaCorporea/calcolo_indice/lib/icon_content.dart';

import 'package:calcolo_indice/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calcolo_indice/constancts.dart';
import 'calculator_brain.dart';

//creo un tipo gender di tipo valori
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int peso = 60;
  int eta = 19;

  void aumentaPeso() {
    setState(() {
      peso++;
    });
  }

  void diminuisciPeso() {
    setState(() {
      peso--;
    });
  }

  //questa è la variabile di tipo Gender con valore null, la uso come contenitore
  //quindi all'interno del set state assegno a questa variabile male se viene usata in male
  //femanle se viene usata nel set state di female
  Gender selectedGender;

  //setto entrambi i colori su inattivi
  Color maleCardColour = kinactiveCardColor;
  Color femaleCardColour = kinactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App chiattoni'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      labelText: 'Uomo',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      labelText: 'Donna',
                    ),
                    colour: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Altezza',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(' cm'),
                    ],
                  ),
                  //slider theme data consente di costumizzare lo slider in ogni suo aspetto
                  //il metodo of() mantiene  lo stesso context  dove abbiamo definito lo slider
                  //con il metodo copyWith() modifichiamo lo slider in ogni suo particolare
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      //il valore principale
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //parte sinistra della barra
                      activeColor: Color(0xffeb1555),
                      //parte destra della barra
                      inactiveColor: Color(0xff8d8e98),
                      //meotodo on pressed
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Peso",
                          style: klabelTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: diminuisciPeso,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: aumentaPeso,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Età",
                          style: klabelTextStyle,
                        ),
                        Text(
                          eta.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  eta--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  eta++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    colour: kactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcola',
            onTap: () {
              CalculatorBrain calc =
                  new CalculatorBrain(height: height, weight: peso);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getInterpretation(),
                          interpretation: calc.getResult(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

//custom widget creato usando i widget base messi a disposizione dal framework
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  //Usa due proprietà
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: onPress,
    );
  }
}

/*
  Center(
  child:Text('BMI '),
  ),
  floatingActionButton: Theme(
  data: ThemeData.light(),
  child: FloatingActionButton(
  child: Text('prova'),
  ),
  ),*/
