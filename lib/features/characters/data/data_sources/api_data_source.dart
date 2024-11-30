import 'dart:convert';

import 'package:rick_morty/core/constants/api.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterApiDataSource {
  Future<List<CharacterModel>> getCharacters() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        final charactersJson = result['results'] as List<Map<String, dynamic>>;

        return charactersJson
            .map((character) => CharacterModel.fromJson(character))
            .toList();
      }
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }
}
