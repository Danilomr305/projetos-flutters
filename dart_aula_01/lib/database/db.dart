// ignore: depend_on_referenced_packages, unused_import
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// ignore: unnecessary_import
import 'package:sqflite/sqlite_api.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if(_database != null) return _database;

    // ignore: await_only_futures
    return await _initDatabase();

  }

  // ignore: unused_element
  _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'cripto.db'),
      version: 1,
      onCreate: _onCreate,
    );
    // ignore: dead_code
    return _database;
  }

  _onCreate(db, versao) async {
    await db.execute(_conta);
    await db.execute(_carteira);
    await db.execute(_historico);
    await db.insert('conta', {'saldo' : 0});
  }

  String get _conta => '''
    CREATE TABLE  conta(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      saldo REAL
    );
  ''';

  String get _carteira => '''
    CREATE TABLE  carteira (
      sigla TEXT PRIMARY KEY,
      moeda TEXT,
      quantidade TEXT
    );
  ''';

  String get _historico => '''
    CREATE TABLE  historico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data_operacao INT,
      tipo_operacao TEXT,
      moeda TEXT,
      sigla TEXT,
      valor REAL,
      quantidade TEXT
    );
  ''';
}