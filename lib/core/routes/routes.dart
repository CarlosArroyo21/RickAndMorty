import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/presentation/pages/character_details_screen.dart';
import 'package:rick_morty/features/characters/presentation/pages/favorites_characters_screen.dart';
import 'package:rick_morty/features/characters/presentation/pages/home_screen.dart';
import 'package:rick_morty/features/characters/presentation/pages/map_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesCharactersScreen(),
    ),
    GoRoute(
      path: '/character-details',
      builder: (context, state) {
        final characterDetails = state.extra as Character;
        return CharacterDetailsScreen(characterDetails: characterDetails);
      },
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
    ),
  ],
);
