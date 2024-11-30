import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/core/constants/hive_boxes.dart';
import 'package:rick_morty/core/hive/hive_registrar.g.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapters();

  await Hive.openBox(favoriteCharactersBox);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
