import 'dart:convert';
import 'package:rick_morty/core/constants/api.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterApiDataSource {
  Future<List<CharacterModel>> getCharactersOf({required int page}) async {
    try {
      final response = await http.get(Uri.parse("$apiUrl/?page=$page"));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final charactersJson = result['results'];


        final characters = (charactersJson as List)
            .map((character) => CharacterModel.fromJson(character))
            .toList();

        return characters;
      }
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }
}
