// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/widgets.dart';

import '../models/casa.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Casa> _lista = [];

  UnmodifiableListView<Casa> get lista => UnmodifiableListView(_lista);

  saveall(List<Casa> casa) {
    casas.forEach((casa) {
      if (!_lista.contains(casa)) _lista.add(casa);
     });
  }

  remove(Casa casa) {
    _lista.remove(casa);
    notifyListeners();
  }
}
