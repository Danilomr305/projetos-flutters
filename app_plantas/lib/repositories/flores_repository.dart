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
      nome: nome, 
      altura: altura, 
      brasao: '', 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),

    Flor(
      nome: nome, 
      altura: altura, 
      brasao: brasao, 
      cor: cor,
    ),
    ]
  );
  }
}
