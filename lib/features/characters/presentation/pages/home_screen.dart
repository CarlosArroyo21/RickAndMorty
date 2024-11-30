import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/service_locator/service_locator.dart';
import 'package:rick_morty/features/characters/presentation/mobx/character_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    final characterStore = sl<CharactersList>();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        characterStore.getCharacters();
      }
    });
    characterStore.getFavoriteCharacters();
    characterStore.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final characterStore = sl<CharactersList>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rick & Morty'),
          actions: [
            IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  context.push('/favorites');
                }),
            IconButton(
                icon: const Icon(Icons.map_outlined),
                onPressed: () {
                  context.push('/map');
                })
          ],
        ),
        body: Observer(
            builder: (BuildContext context) => Center(
                child: characterStore.charactersList.isEmpty &&
                        characterStore.isLoading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: characterStore.charactersList.length +
                            (characterStore.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == characterStore.charactersList.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          // final isFavoriteCharacter = characterStore
                          //     .isFavorite(characterStore.charactersList[index]);

                          return ListTile(
                            title:
                                Text(characterStore.charactersList[index].name),
                            trailing: Observer(
                              builder: (BuildContext context) => IconButton(
                                  icon: Icon(characterStore.isFavorite(
                                          characterStore.charactersList[index])
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  onPressed: () {
                                    if (characterStore.isFavorite(
                                        characterStore.charactersList[index])) {
                                      characterStore.removeFavoriteCharacter(
                                          characterStore.charactersList[index]);
                                    } else {
                                      characterStore.addFavoriteCharacter(
                                          characterStore.charactersList[index]);
                                    }
                                  }),
                            ),
                            onTap: () {
                              context.push('/charater-details',
                                  extra: characterStore.charactersList[index]);
                            },
                          );
                        }))));
  }
}
