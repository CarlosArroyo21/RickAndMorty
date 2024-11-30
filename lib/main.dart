import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/core/constants/hive_boxes.dart';
import 'package:rick_morty/core/hive/hive_registrar.g.dart';
import 'package:rick_morty/core/routes/routes.dart';
import 'package:rick_morty/core/service_locator/service_locator.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<CharacterModel>(favoriteCharactersBox);

  //Init service locator
  init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
