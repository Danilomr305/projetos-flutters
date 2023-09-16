import 'moeda.dart';

class Posicao {
  late Moeda moeda;
  double quantidade;

  Posicao({
    required this.moeda,
    required this.quantidade
  });
}