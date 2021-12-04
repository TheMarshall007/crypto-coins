import 'package:crypto_coins/configs/app_settings.dart';
import 'package:crypto_coins/configs/hive_configs.dart';
import 'package:crypto_coins/meu_aplicativo.dart';
import 'package:crypto_coins/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository())
      ],
      child: MeuAplicativo(),
    ),
  );
}
