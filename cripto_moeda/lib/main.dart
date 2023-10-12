import 'package:cripto_moeda/meu_aplicativo.dart';
import 'package:cripto_moeda/repositories/conta_repository.dart';
import 'package:cripto_moeda/repositories/favoritas_repository.dart';
import 'package:cripto_moeda/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'configs/app_settings.dart';
import 'configs/hive_confing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ContaRepository()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository(
           auth: context.read<AuthService>()
        )),
      ],
      child: const MeuAplicativo(),
    ),
  );
} 