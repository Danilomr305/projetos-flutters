import 'frases.dart';

class Helper{

  // ignore: unused_field
  final List<Frases> _frasesData = [
    Frases(
      frasesTitle: 
      'Vamos conhecer mais sobre as plantas!!!',
      choice1: 'Vamos Começar!',
      choice2: ''),

    Frases(
      frasesTitle:
      'As Tulipas simbolizam o amor perfeito. Esse simbolismo está muito arraigado com as culturas da Turquia e da Pérsia.', 
      choice1: 'Próxima flor!',
      choice2: ''),
      
    Frases(
      frasesTitle: 
      'Hoje em dia a orquídea é uma flor que que está associada à sexualidade e beleza feminina.', 
      choice1: 'Próxima flor!',
      choice2: ''),
    Frases(
      frasesTitle: 
      'Rosas. Representa o amor e suas nuances, para cada cor um significado, a Vermelha significa Amor intenso a Branca significa Inocência e beleza a Rosa, Respeito e admiração e a Amarela significa Felicidade e amizade.',
      choice1: 'Próxima flor!',
      choice2: ''),
      Frases(
        frasesTitle: 
        'Rosa do Deseto BRIDAL é talvez a rosa do deserto mais procurada pelos colecionadores. De amarelo bem definido e multiplas camadas, todo colecionador ou apaixonado pelas rosas do deserto deve ter na sua coleção.', 
        choice1: 'Próxima flor!', 
        choice2: ''),
  ];


  String getFrases(){
    return _frasesData[_frasesNumber].frasesTitle;
  }

  

  String getChoice1(){
    return _frasesData[_frasesNumber].choice1;
  }

  String getChoice2(){
    return _frasesData[_frasesNumber].choice2;
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

    bool buttonShouldBeVisible(){
      if(_frasesNumber == 0 || _frasesNumber == 1 ||_frasesNumber ==  2){
        return true;
      }else{
        return false;
      }
    }
}

