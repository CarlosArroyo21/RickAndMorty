import 'package:rick_morty/features/characters/data/data_sources/api_data_source.dart';
import 'package:rick_morty/features/characters/data/data_sources/hive_data_source.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApiDataSource _characterApiDataSource;

  CharacterRepositoryImpl(this._characterApiDataSource);

  @override
  Future<List<Character>> getCharactersOf({required int page}) async {
    final characters = await _characterApiDataSource.getCharactersOf(page: page);

    return characters.map((character) => character.toEntity()).toList();
  } 
}

class FavoriteCharacterRepositoryImpl implements FavoriteCharacterRepository {
  final FavoriteCharactersHiveDataSource _favoriteCharactersHiveDataSource;

  FavoriteCharacterRepositoryImpl(this._favoriteCharactersHiveDataSource);

  @override
  Future<void> addFavoriteCharacter(Character character) async {
    final characterModel = CharacterModel.fromEntity(character);
    await _favoriteCharactersHiveDataSource.addFavoriteCharacter(characterModel);
  }

  @override
  List<Character> getFavoriteCharacters() {
    final favoriteCharactersEntities = _favoriteCharactersHiveDataSource
        .getFavoriteCharacters().map((character) => character.toEntity()).toList();

    return favoriteCharactersEntities;
  }

  @override
  Future<void> removeFavoriteCharacter(int characterIndex) async {
    return await _favoriteCharactersHiveDataSource
        .removeFavoriteCharacter(characterIndex);
  }
}
