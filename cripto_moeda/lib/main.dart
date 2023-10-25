import 'package:cripto_moeda/meu_aplicativo.dart';
import 'package:cripto_moeda/repositories/conta_repository.dart';
import 'package:cripto_moeda/repositories/favoritas_repository.dart';
import 'package:cripto_moeda/repositories/moeda_repository.dart';
import 'package:cripto_moeda/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'configs/app_settings.dart';
import 'configs/hive_confing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => MoedaRepository()),
        ChangeNotifierProvider(create: (context) => ContaRepository(
          moedas: context.read<MoedaRepository>()
        )),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository(
          auth: context.read<AuthService>(),
          moedas: context.read<MoedaRepository>()
        )),
      ],
      child: const MeuAplicativo(),
    ),
  );
} 