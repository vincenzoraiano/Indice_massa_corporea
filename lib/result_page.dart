import 'dart:core';

import 'package:calcolo_indice/bottom_button.dart';
import 'package:calcolo_indice/constancts.dart';
import 'package:calcolo_indice/reusable_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult,this.resultText,this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        title: Text('Calcolatore massa'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Il tuo risultato',
                  style: kTitleTextStyle,
                )),
          ),
          Expanded(
            flex: 12,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultText,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Calcola Ancora',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
