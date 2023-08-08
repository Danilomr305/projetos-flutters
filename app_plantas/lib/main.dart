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
        child:  SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Text(
                      helper.getFrases(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white
                      ),
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