import 'package:flutter/material.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character charaterDetails;
  const CharacterDetailsScreen({super.key, required this.charaterDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(charaterDetails.name)),
      body: Center(child: Text(charaterDetails.name)));
  }
}