import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  //creo una variabile accessibile da tutti i metodi
  double _bmi;

  //il metodo ritorna una stringa
  String calculateBMI() {
    //l'altezza è in centimetri quindi viene divisa per 100
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sovrappeso';
    } else if (_bmi > 18.5) {
      return 'Normale';
    } else {
      return 'Sottopeso';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'Vai in palestra';
    } else if (_bmi > 18.5) {
      return 'Forma normale';
    } else {
      return 'Devi mangiare';
    }
  }
}
