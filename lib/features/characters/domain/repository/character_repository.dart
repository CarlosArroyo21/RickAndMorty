import 'package:rick_morty/features/characters/domain/entities/character.dart';
abstract class CharacterRepository {

  Future<List<Character>> getCharactersOf({required int page});
}

abstract class FavoriteCharacterRepository {
  List<Character> getFavoriteCharacters();
  Future<void> addFavoriteCharacter(Character character);
  Future<void> removeFavoriteCharacter(int characterIndex);
}