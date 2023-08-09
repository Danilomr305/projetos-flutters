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

  final int _frasesNumber = 0;
}

