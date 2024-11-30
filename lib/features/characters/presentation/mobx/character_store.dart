import 'package:mobx/mobx.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/use_cases/add_favorite_character.dart';
import 'package:rick_morty/features/characters/domain/use_cases/get_characters.dart';
import 'package:rick_morty/features/characters/domain/use_cases/get_favorite_characters.dart';
import 'package:rick_morty/features/characters/domain/use_cases/remove_favorite_character.dart';

part 'character_store.g.dart';

// ignore: library_private_types_in_public_api
class CharactersList = _CharactersList with _$CharactersList;

abstract class _CharactersList with Store {
  final AddFavoriteCharacterUseCase addFavoriteCharacterUseCase;
  final GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;
  final RemoveFavoriteCharacterUseCase removeFavoriteCharacterUseCase;
  final GetCharactersUseCase getCharactersUseCase;

  @observable
  ObservableList<Character> favoriteCharacters = ObservableList<Character>();

  @observable
  ObservableList<Character> charactersList = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  int page = 1;

  _CharactersList(
      {required this.addFavoriteCharacterUseCase,
      required this.getFavoriteCharactersUseCase,
      required this.removeFavoriteCharacterUseCase,
      required this.getCharactersUseCase});

  @action
  Future<void> getCharacters() async {
    if (isLoading) return;
    isLoading = true;

    final characters = await getCharactersUseCase.call(page: page);

    charactersList.addAll(characters);

    isLoading = false;
    page++;
  }

  @action
  void getFavoriteCharacters() {
    favoriteCharacters.clear();
    favoriteCharacters.addAll(getFavoriteCharactersUseCase.call());
  }

  @action
  Future<void> addFavoriteCharacter(Character character) async {
    await addFavoriteCharacterUseCase.call(character);
    favoriteCharacters.add(character);
  }

  @action
  Future<void> removeFavoriteCharacter(Character character) async {
    final characterIndex = _getCharacterIndex(character);

    await removeFavoriteCharacterUseCase.call(characterIndex);
    favoriteCharacters.removeWhere((favoriteCharacter) => favoriteCharacter.id == character.id);
  }

  int _getCharacterIndex(Character character) {
    return favoriteCharacters.indexWhere((favoriteCharacter) => favoriteCharacter.id == character.id);
  }

  bool isFavorite(Character character) {
    return favoriteCharacters
        .any((favoriteCharacter) => favoriteCharacter.id == character.id);
  }
}
