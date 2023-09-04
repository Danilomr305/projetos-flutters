// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/casa.dart';
// ignore: unused_import
import '../models/atividade.dart';

  class CasaRepository {
    final List<Casa> _casa = [];

     // ignore: unnecessary_this
     get casa => this._casa;

     void addAtivida({
    required Casa casa, 
    required Atividade atividade,
  }) {
    casa.titulo.add(atividade);
  }

    // ignore: empty_constructor_bodies
    CasaRepository() {
       _casa.addAll([
      Casa(
        nome: '1. Arrumar a cama', 
        brasao: 'https://images.pexels.com/photos/9462346/pexels-photo-9462346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '2. Limpar a cozinha ', 
        brasao: 'https://images.pexels.com/photos/8580763/pexels-photo-8580763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '3. Retirar o lixo', 
        brasao: 'https://images.pexels.com/photos/8543601/pexels-photo-8543601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '4. Limpar o fogão', 
        brasao: 'https://images.pexels.com/photos/9462301/pexels-photo-9462301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '5. Varrer e aspirar o chão', 
        brasao: 'https://images.pexels.com/photos/10557499/pexels-photo-10557499.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '6. Limpar a máquina de lavar', 
        brasao: 'https://images.pexels.com/photos/4546168/pexels-photo-4546168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '7. Limpar o banheiro', 
        brasao: 'https://images.pexels.com/photos/4098764/pexels-photo-4098764.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ),

      Casa(
        nome: '8. Lavar a roupa', 
        brasao: 'https://images.pexels.com/photos/9462223/pexels-photo-9462223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '9. Organizar guarda-roupas', 
        brasao: 'https://images.pexels.com/photos/4545966/pexels-photo-4545966.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),

      Casa(
        nome: '10. Trocar a roupa de cama', 
        brasao: 'https://images.pexels.com/photos/5331120/pexels-photo-5331120.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ),
    ]   
  );  
  }
}

