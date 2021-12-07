import 'package:crypto_coins/configs/app_settings.dart';
import 'package:crypto_coins/configs/hive_configs.dart';
import 'package:crypto_coins/repositories/conta_repository.dart';
import 'package:crypto_coins/repositories/favoritas_repository.dart';
import 'package:crypto_coins/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'meu_aplicativo.dart';

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
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(
            auth: context.read<AuthService>(),
          ),
        ),
      ],
      child: MeuAplicativo(),
    ),
  );
}