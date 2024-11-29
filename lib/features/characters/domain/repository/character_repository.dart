import 'package:rick_morty/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {

  Future<List<Character>> getCharacters();
  Future<Character> getCharacterDetails(int id);
}

abstract class FavoriteCharacterRepository {
  Future<List<Character>> getFavoriteCharacters();
  Future<void> addFavoriteCharacter(Character character);
  Future<void> removeFavoriteCharacter(int characterId);
}