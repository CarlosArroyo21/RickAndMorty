import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class GetFavoriteCharactersUseCase {
  final FavoriteCharacterRepository repository;

  GetFavoriteCharactersUseCase(this.repository);

  List<Character> call() {
    return repository.getFavoriteCharacters();
  }
}