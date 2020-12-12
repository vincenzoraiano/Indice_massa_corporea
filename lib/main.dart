
import 'package:flutter/material.dart';

import 'input_page.dart';



void main() => runApp(CalcoloMassa());

class CalcoloMassa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //il teme data va definito all'interno del material app
      //il themeData da il colore a tutti i widget custom utilizzati da flutter
      //consente di cosutmizzare la nostra app attraverso tutti gli schermi di essa
      //dark() è un teme di default che mette a disposizione flutter
      //copyWith() è un metodo che consente di modificare il il theme data
      theme: ThemeData.dark().copyWith(
          //posso inserire qui il valore dello slider theme
          primaryColor: Color(0xff0a0e21),
          scaffoldBackgroundColor: Color(0xff0a0e21)),
      home: InputPage(),

    );
  }
}

/*floatingActionButton: Theme(
data: ThemeData.light(),
child: FloatingActionButton(
child: Text('prova'),
),
),*/