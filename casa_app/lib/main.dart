import 'package:flutter/material.dart';

import 'pages/home_casa.dart';

void main() {
  runApp(const Primeira());
}

class Primeira extends StatelessWidget {
  const Primeira({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}
