import 'package:app_plantas/models/titulo.dart';
import 'package:flutter/material.dart';

class Flor {
  String nome;
  String brasao;
  Color cor;
  late List<Titulo> titulo = [];

  Flor({
    required this. nome,
    required this.brasao,
    required this.cor
  }
);
}