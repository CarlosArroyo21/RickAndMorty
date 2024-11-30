import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase(this.repository);

  Future<List<Character>> call({required int page}) => repository.getCharactersOf(page: page);
}