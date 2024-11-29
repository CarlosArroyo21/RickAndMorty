import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class RemoveFavoriteCharacterUseCase {
  final FavoriteCharacterRepository repository;
  
  RemoveFavoriteCharacterUseCase(this.repository);

  Future<void> call(int characterId) => repository.removeFavoriteCharacter(characterId);
}