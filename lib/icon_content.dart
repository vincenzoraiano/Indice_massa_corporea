
import 'package:flutter/material.dart';
import 'package:calcolo_indice/constancts.dart';

class IconContent extends StatelessWidget {
  IconContent({this.labelText, this.icon});

  //semplice stringa
  final String labelText;
  //tipo di dato IconData
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //controllando il tipo di dato che la classe Icon riceve posso capire
        //che il tipo di dato è un IconData
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          labelText,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
