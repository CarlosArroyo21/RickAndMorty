import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

class FavoriteCharactersHiveDataSource {
  final Box<CharacterModel> _favoriteCharactersBox;

  FavoriteCharactersHiveDataSource(this._favoriteCharactersBox);

  List<CharacterModel> getFavoriteCharacters() {
    return _favoriteCharactersBox.values.toList();
  }
  Future<void> addFavoriteCharacter(CharacterModel character) async {
    final result = await _favoriteCharactersBox.add(character);
    print("what is this result $result");
  }
  Future<void> removeFavoriteCharacter(int characterId) async {
    return await _favoriteCharactersBox.delete(characterId);
  }
  
}