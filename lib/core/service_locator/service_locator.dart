import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/core/constants/hive_boxes.dart';
import 'package:rick_morty/features/characters/data/data_sources/api_data_source.dart';
import 'package:rick_morty/features/characters/data/data_sources/hive_data_source.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/features/characters/data/repository/repository_impl.dart';
import 'package:rick_morty/features/characters/domain/repository/character_repository.dart';
import 'package:rick_morty/features/characters/domain/use_cases/add_favorite_character.dart';
import 'package:rick_morty/features/characters/domain/use_cases/get_characters.dart';
import 'package:rick_morty/features/characters/domain/use_cases/get_favorite_characters.dart';
import 'package:rick_morty/features/characters/domain/use_cases/remove_favorite_character.dart';
import 'package:rick_morty/features/characters/presentation/mobx/character_store.dart';

final sl = GetIt.instance;

void init() {
  //Data sources
  sl.registerLazySingleton<CharacterApiDataSource>(
      () => CharacterApiDataSource());
  sl.registerLazySingleton<FavoriteCharactersHiveDataSource>(
      () => FavoriteCharactersHiveDataSource(Hive.box<CharacterModel>(favoriteCharactersBox)));

  //Repositories
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(sl<CharacterApiDataSource>()));

  sl.registerLazySingleton<FavoriteCharacterRepository>(() =>
      FavoriteCharacterRepositoryImpl(sl<FavoriteCharactersHiveDataSource>()));

  //Use cases
  sl.registerLazySingleton<GetCharactersUseCase>(
      () => GetCharactersUseCase(sl<CharacterRepository>()));
  sl.registerLazySingleton<AddFavoriteCharacterUseCase>(
      () => AddFavoriteCharacterUseCase(sl<FavoriteCharacterRepository>()));
  sl.registerLazySingleton<RemoveFavoriteCharacterUseCase>(
      () => RemoveFavoriteCharacterUseCase(sl<FavoriteCharacterRepository>()));
  sl.registerLazySingleton<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(sl<FavoriteCharacterRepository>()));

  //Store
  sl.registerLazySingleton<CharactersList>(() => CharactersList(
      addFavoriteCharacterUseCase: sl<AddFavoriteCharacterUseCase>(),
      removeFavoriteCharacterUseCase: sl<RemoveFavoriteCharacterUseCase>(),
      getCharactersUseCase: sl<GetCharactersUseCase>(),
      getFavoriteCharactersUseCase: sl<GetFavoriteCharactersUseCase>()));
}
