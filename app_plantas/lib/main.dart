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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                  color: Colors.black,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,   
                    horizontal: 25.0, 
                  ),
                    child: ListTile(
                      leading:
                        const Icon(Icons.ad_units,
                        color: Colors.blue,
                        ),
                      title:    
                        Text(helper.getFrases(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),  
                    ),
                ),
            ],
          )
          ),
        ),
      );
  }
}