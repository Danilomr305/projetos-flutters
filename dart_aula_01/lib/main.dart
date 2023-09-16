 import 'package:dart_aula_01/repositories/conta_repository.dart';
import 'package:dart_aula_01/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'configs/app_settings.dart';  
import 'configs/hive_confing.dart';
// ignore: duplicate_import
import 'meu_aplicativo.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await  HiveConfig.start();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContaRepository()
        ),
        ChangeNotifierProvider(
          create: (context) => AppSettings()
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(),
        ),
      ],
      child: const MeuAplicativo(),
    ),
  );
}

