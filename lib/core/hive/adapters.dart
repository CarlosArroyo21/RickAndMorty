import 'package:hive_ce/hive.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';

part 'adapters.g.dart';

@GenerateAdapters([AdapterSpec<CharacterModel>(), AdapterSpec<LocationModel>()])
class HiveCharactersAdapters {}
