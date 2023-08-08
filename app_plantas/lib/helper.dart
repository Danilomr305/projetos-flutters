import 'frases.dart';

class Helper{
  // ignore: unused_field
  final List<Frases> _frasesData = [
    Frases(
      frasesTitle: 
      'Olá Amantes de Plantas')
  ];
  String getFrases() {
    return _frasesData[_frasesNumber].frasesTitle;
  }

  final int _frasesNumber = 0;
}