// ignore: unused_import
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0), 
                ),
                CircleAvatar( 
                backgroundImage: 
                  AssetImage('imagens/casas.jpeg'),
                radius: 50,
                ),
              ],
            ),  
          ), 
        ),
      ),
    );
  }
}