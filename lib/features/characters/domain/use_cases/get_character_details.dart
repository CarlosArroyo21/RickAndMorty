import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class GetCharacterDetailsUseCase {
  final CharacterRepository repository;

  GetCharacterDetailsUseCase(this.repository);

  Future<Character> call(int id) => repository.getCharacterDetails(id);
}