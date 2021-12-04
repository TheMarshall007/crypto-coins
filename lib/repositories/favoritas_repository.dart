import 'dart:collection';
import 'package:crypto_coins/models/moedas.dart';
import 'package:flutter/material.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Moeda> _lista = [];

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas) {
    moedas.forEach((moeda) {
      if (!_lista.any((atual) => atual.sigla == moeda.sigla)) _lista.add(moeda);
    });
    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
    notifyListeners();
  }
}
