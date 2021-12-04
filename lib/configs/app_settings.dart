import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
class AppSettings extends ChangeNotifier {
  //Esse trecho utiliza o SharedPreferences para armazenas as informações localmente
  // late SharedPreferences _prefs;

  //Esse trecho utiliza o Hive para armazenas as informações localmente
  late Box box;

  Map<String, String> locale = {
    'locale': 'pt_BR',
    'name': 'R\$',
  };

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    //Esse trecho utiliza o SharedPreferences
    // _prefs = await SharedPreferences.getInstance();

    //Esse trecho utiliza o Hive
    box = await Hive.openBox('preferencias');
  }

  _readLocale() {
    //Esse trecho utiliza o SharedPreferences
    // final local = _prefs.getString('local') ?? 'pt_BR';
    // final name = _prefs.getString('name') ?? 'R\$';

    //Esse trecho utiliza o Hive
    final local = box.get('local') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';
    locale = {
      'locale': local,
      'name': name,
    };
    notifyListeners();
  }

  setLocale(String local, String name) async {
    //Esse trecho utiliza o SharedPreferences
    // await _prefs.setString('local', local);
    // await _prefs.setString('name', name);

    //Esse trecho utiliza o Hive
    await box.put('local', local);
    await box.put('name', name);

    await _readLocale();
  }
}
