// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/flor.dart';
// ignore: unused_import
import '../models/titulo.dart';

class FloresRepository {
  final List<Flor> _flores = [];

  // ignore: unnecessary_this
  get flores => this._flores;
  
  void addTitulo({
    required Flor flor, 
    required Titulo titulo
  }) {
    flores.titulo.add(titulo);
  }

  FloresRepository() {
    _flores.addAll([
      Flor(
        nome: 'Girassol Vermelha',
         brasao: 'https://i.pinimg.com/originals/9b/cd/8f/9bcd8fcd2ef0b4292ba721437a0ef715.jpg',
          cor: Colors.red.shade300,
      ),

      Flor(
        nome: 'Girassol Amarelo', 
        brasao: 'https://i.pinimg.com/564x/98/4e/fc/984efc9bcd44921a166d55944bcfa8a2.jpg', 
        cor: Colors.yellow.shade300,
      ),

      Flor(
        nome: 'dieffenbachia', 
        brasao: 'https://i.pinimg.com/564x/e4/30/3c/e4303ce1995563bd9d77358b39eb8b80.jpg', 
        cor: Colors.green.shade300,
      ),

      Flor(
        nome: nome, 
        brasao: brasao, 
        cor: cor,
      ),
    ] 
  );
  }
}
