import 'frases.dart';

class Helper{
  // ignore: unused_field
  final List<Frases> _frasesData = [
    Frases(
      frasesTitle: 
      'Olá Amantes de Plantas'),
    Frases(
      frasesTitle: 
      'Vamos conhecer mais as sobres as plantas!!!')
  ];
  String getFrases() {
    return _frasesData[_frasesNumber].frasesTitle;
  }

  final int _frasesNumber = 0;
}