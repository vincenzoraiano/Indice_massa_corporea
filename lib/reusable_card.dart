import 'package:flutter/material.dart';

//widget usato creando il refactor, lo posso riutilizzare in tutte le colonne precedentemente
//usate codi da ripetermi il meno possibile, il csotruttore di default puo essere rimosso


class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardchild,this.onPress});
  //creo la proprietà di tipo Color, con identifier colour
  //viene anche chiamata instance variabile/field/property, in flutter useiamo property
  //è una proprieta che cambia all'interno della classe e possiamo attribuirgli un valore diverso
  final Color colour;
  //qualsiasi widget passo in questo posto, sara sempre un child del Container
  final Widget cardchild;

  //passo una funzione come proprietà
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}