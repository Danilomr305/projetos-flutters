import 'package:flutter/material.dart';
// ignore: unused_import
import 'pages/login_page.dart';

void main() => runApp(const TelaInicial());


class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Casa App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.indigo),

        home: const LoginPage(),
        );
  }  
}