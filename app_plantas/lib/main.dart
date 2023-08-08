import 'package:flutter/material.dart';
// ignore: unused_import
import 'helper.dart';

void main() => runApp(const Plantas());


class Plantas extends StatelessWidget {
  const Plantas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Clima(),
    );
  }
}

Helper helper = Helper();

class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'imagem/fundo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 15.0,   
                    horizontal: 28.0, 
                  ),  
                    child:    
                      Text(
                        'OLÁ AMANTES DE PLANTAS!',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),  
                  ),
                Center(
                  
                )
                ]
              ),
            )
        ),
      );
  }
}