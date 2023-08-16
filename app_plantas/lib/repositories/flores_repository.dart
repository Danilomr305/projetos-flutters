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
        nome: ' Samambaia', 
        brasao: 'https://i.pinimg.com/564x/80/2a/bf/802abfda722dd54e425b6f6fbc7505aa.jpg', 
        cor: Colors.green,
      ),

      Flor(
        nome: 'Jiboia',
        brasao: 'https://i.pinimg.com/564x/9d/0b/28/9d0b28be4b77b36b8a3cfbab252464a0.jpg',
        cor: Colors.green,
      ),

      Flor(
        nome: 'Espada_de_São_Jorge' ,
        brasao: 'https://i.pinimg.com/564x/d5/cf/79/d5cf79c3ccad399c59b8c4ef4a1c0e24.jpg',
        cor: Colors.yellow,
      ),

      Flor(
        nome: 'Costela de Adão',
        brasao: 'https://i.pinimg.com/564x/73/6a/be/736abe0c97c51d445a10502bc6641cc8.jpg',
        cor: Colors.green,
      ),

      Flor(
        nome: 'Zamioculas' ,
        brasao: 'https://i.pinimg.com/564x/fc/19/15/fc1915102d6069eb9addbc5d6c1c02f5.jpg',
        cor: Colors.green,
      ),

      Flor(
        nome: 'Orquieda',
        brasao: 'https://i.pinimg.com/564x/97/9b/9c/979b9ca75cc656080b208a19593eb0df.jpg',
        cor: Colors.white,
      ),

      Flor(
        nome: 'Palmeira Ráfia',
        brasao: 'https://i.pinimg.com/564x/10/1e/8e/101e8e7ce09c6a22d98a9d98aba26764.jpg',
        cor: Colors.brown,
      ),

      Flor(
        nome: 'Maranta tricolor',
        brasao: 'https://i.pinimg.com/736x/76/f3/b8/76f3b88a4405b8b66d3efb09ea297a29.jpg',
        cor: Colors.pink,
      ),

      Flor(
        nome: 'Zamioculca',
        brasao: 'https://i.pinimg.com/564x/66/17/1e/66171ecc6ab389897345df62041f882c.jpg',
        cor: Colors.green.shade900,
      ),

      Flor(
        nome: ,
        brasao: ,
        cor: ,
      ),

      Flor(
        nome: ,
        brasao: ,
        cor: ,
      ),

      Flor(
        nome ,
        brasao: ,
        cor: ,
      ),

      Flor(
        nome ,
        brasao: ,
        cor: ,
      ),
    ]   
  );      
  } 
}  
 