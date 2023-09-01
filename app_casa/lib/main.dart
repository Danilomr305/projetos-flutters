import 'package:flutter/material.dart';
// ignore: unused_import
import 'botoes.dart';

void main() {
  runApp(const TelaInicial());
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(90.0),
          child: Center(
            child: Image(
              image: AssetImage('imagens/cs.jpg',
              )
            ),

          ),
        ),
      
      ),
    );
  }
}
