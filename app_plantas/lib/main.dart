import 'package:flutter/material.dart';

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
        ),
      );
  }
}