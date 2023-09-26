import 'dart:collection';
import 'package:cripto_moeda/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../adapters/moeda_hive_adapter.dart';
import '../models/moeda.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];
  late LazyBox box;

  FavoritasRepository({required AuthService auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

  _openBox() async {
    Hive.registerAdapter(MoedaHiveAdater());
    box = await Hive.openLazyBox<Moeda>('moedas_favoritas');
  }


  _readFavoritas() {
    // ignore: avoid_function_literals_in_foreach_calls
    box.keys.forEach((moeda) async { 
      Moeda m = await box.get(moeda);
      _lista.add(m);
      notifyListeners();
    });
  }

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas){
    // ignore: avoid_function_literals_in_foreach_calls
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
        box.put(moeda.sigla, moeda);
      }
    });
    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }
}