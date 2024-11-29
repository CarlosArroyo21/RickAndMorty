import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class AddFavoriteCharacterUseCase {
  
  final FavoriteCharacterRepository repository;
  
  AddFavoriteCharacterUseCase(this.repository);
  
  Future<void> call(Character character) => repository.addFavoriteCharacter(character);
  
}