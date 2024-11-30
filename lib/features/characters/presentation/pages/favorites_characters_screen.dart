import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/service_locator/service_locator.dart';
import 'package:rick_morty/features/characters/presentation/mobx/character_store.dart';

class FavoritesCharactersScreen extends StatelessWidget {
  const FavoritesCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterStore = sl<CharactersList>();

    return Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: Observer(
            builder: (BuildContext context) => Center(
                child: characterStore.favoriteCharacters.isEmpty
                    ? const Text("No hay favoritos")
                    : ListView.builder(
                        itemCount: characterStore.favoriteCharacters.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(characterStore.favoriteCharacters[index].name),
                            subtitle: Text(
                                characterStore.favoriteCharacters[index].status),
                            leading: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Aplica el borde redondeado a la imagen
                                child: Image.network(
                                  characterStore.favoriteCharacters[index].image,
                                  fit: BoxFit
                                      .cover, // Ajusta cómo la imagen se escala
                                ),
                              ),
                            ),
                            trailing: Observer(
                              builder: (BuildContext context) => IconButton(
                                  icon: Icon(characterStore.isFavorite(
                                          characterStore.favoriteCharacters[index])
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  onPressed: () {
                                    if (characterStore.isFavorite(
                                        characterStore.favoriteCharacters[index])) {
                                      characterStore.removeFavoriteCharacter(
                                          characterStore.favoriteCharacters[index]);
                                    } else {
                                      characterStore.addFavoriteCharacter(
                                          characterStore.favoriteCharacters[index]);
                                    }
                                  }),
                            ),
                            onTap: () {
                              context.push('/charater-details',
                                  extra: characterStore.favoriteCharacters[index]);
                            },
                          );
                        }))));
  }
}
