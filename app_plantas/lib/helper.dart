import 'frases.dart';

class Helper{

  // ignore: unused_field
  final List<Frases> _frasesData = [
    Frases(
      frasesTitle: 
      'Vamos conhecer mais sobre as plantas!!!',
      choice: 'Vamos Começar!'),

    Frases(frasesTitle:
     'As Tulipas simbolizam o amor perfeito. Esse simbolismo está muito arraigado com as culturas da Turquia e da Pérsia.', 
     choice: 'Próxima flor!'),
      
    Frases(frasesTitle: 
    'Hoje em dia a orquídea é uma flor que que está associada à sexualidade e beleza feminina.', 
    choice: 'Próxima flor!')
  ];

  String getFrases() {
    return _frasesData[_frasesNumber].frasesTitle;
  }

  String getChoice(){
    return _frasesData[_frasesNumber].choice;
  }

  int _frasesNumber = 0;

    void nextFrase(int userFrase){
    if(userFrase == 1 && _frasesNumber == 0) {
      _frasesNumber = 2;
    }else if (userFrase == 2 && _frasesNumber == 0) {
      _frasesNumber = 1;
    } else if (userFrase == 1 && _frasesNumber == 1) {
      _frasesNumber = 3;
    } else if (userFrase == 2 && _frasesNumber == 1) {
      _frasesNumber = 6;
    } else if (userFrase == 1 && _frasesNumber == 2) {
      _frasesNumber = 5;
    } else if (userFrase == 2 && _frasesNumber == 2) {
      _frasesNumber = 4;
    }
    else if(_frasesNumber == 3 || _frasesNumber == 4 || _frasesNumber == 5 || _frasesNumber == 6){
      restart();
    }
}

void restart(){
      _frasesNumber = 0;
    }
    }

