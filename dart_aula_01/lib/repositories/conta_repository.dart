
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../database/db.dart';
// ignore: unused_import
import '../models/moeda.dart';
import '../models/posicao.dart';

class ContaRepository extends ChangeNotifier {
  late Database db;
  // ignore: prefer_final_fields
  List<Posicao> _carteira = [];
  // ignore: prefer_final_fields
  double _saldo = 0;

  get saldo => _saldo;
  List<Posicao> get carteira => _carteira;

  ContaRepository() {
    _initRepository();
  } 

  _initRepository() async {
    await _getSaldo();
  }

  _getSaldo() async {
    db = await DB.instance.database;
    List conta = await db.query('conta', limit:1);
    _saldo = conta.first['saldo'];
    notifyListeners();
  }

  setSaldo(double valor) async {
    db = DB.instance.database;
    db.update('conta', {
      'saldo': valor,
    });
  _saldo = valor;
  notifyListeners();
  }
} 