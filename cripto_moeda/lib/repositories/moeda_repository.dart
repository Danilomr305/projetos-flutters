import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import '../database/db.dart';
import '../models/moeda.dart';

class MoedaRepository extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Moeda> _tabela = [];
  
  List<Moeda> get tabela => _tabela;

  MoedaRepository() {
    _setupMoedasTable();
    _setupDadosTableMoeda();
  }

  _moedasTableIsEmpty() async{
    Database db = await DB.instance.database;
    List resultados = await db.query('moedas');
    return resultados.isEmpty;
  }

  _setupDadosTableMoeda() async {
    if (await _moedasTableIsEmpty()) {
      // ignore: unused_local_variable
      String uri = 'https://api.coinbase.com/v2/assets/search?base=BRL';

      // ignore: unused_local_variable
      final response = await http.get(Uri.parse(uri));
    }
  }

  _setupMoedasTable() async {
    const String table = '''
      CREATE TABLE IF NOT EXISTS moedas (
        baseId TEXT PRIMARY KEY,
        sigla TEXT,
        nome TEXT,
        icone TEXT,
        preco TEXT,
        timestamp INTEGER,
        mudancaHora TEXT,
        mudancaDia TEXT,
        mudancaSemana TEXT,
        mudancaMes TEXT,
        mudancaAno TExt,
        mudancaPeriodoTotal TEXT
      );
    ''';
    Database db = DB.instance.database;
    await db.execute(table);
  }
}