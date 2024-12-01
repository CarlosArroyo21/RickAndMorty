import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/service_locator/service_locator.dart';
import 'package:rick_morty/features/characters/presentation/mobx/character_store.dart';
import 'package:rick_morty/features/characters/presentation/widgets/appbar.dart';
import 'package:rick_morty/features/characters/presentation/widgets/character_status.dart';

class FavoritesCharactersScreen extends StatelessWidget {
  const FavoritesCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterStore = sl<CharactersList>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GlassmorphicAppBar(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Favorite Characters'),
            backgroundColor: Colors.transparent, // Semi-transparente
            elevation: 0,
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                child: Image.asset(
                  'lib/assets/images/background-app.png', // Cambia la ruta según tu archivo
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Observer(
                builder: (BuildContext context) => Center(
                    child: characterStore.favoriteCharacters.isEmpty
                        ? const Text("No hay favoritos")
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 100),
                            itemCount: characterStore.favoriteCharacters.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => context.push('/character-details',
                                    extra: characterStore
                                        .favoriteCharacters[index]),
                                child: Card(
                                  color: const Color.fromARGB(255, 26, 29, 39),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 5,
                                  child: Container(
                                    height: 100,
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        // Imagen (30% del contenedor)
                                        Container(
                                          width: 70,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(characterStore
                                                  .favoriteCharacters[index]
                                                  .image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        // Datos (Nombre y estado)
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                characterStore
                                                    .favoriteCharacters[index]
                                                    .name,
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 10),
                                              Wrap(
                                                spacing: 8,
                                                children: [
                                                  CharacterStatus(
                                                    characterText:
                                                        characterStore
                                                            .favoriteCharacters[
                                                                index]
                                                            .status,
                                                    characterStatusType:
                                                        CharacterStatusType
                                                            .status,
                                                  ),
                                                  CharacterStatus(
                                                    characterText:
                                                        characterStore
                                                            .favoriteCharacters[
                                                                index]
                                                            .gender,
                                                    characterStatusType:
                                                        CharacterStatusType
                                                            .gender,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // Icono de favorito
                                        Observer(
                                          builder: (BuildContext context) =>
                                              IconButton(
                                            icon: const Icon(Icons.favorite),
                                            onPressed: () {
                                              characterStore
                                                  .removeFavoriteCharacter(
                                                      characterStore
                                                              .favoriteCharacters[
                                                          index]);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })))
          ],
        ));
  }
}
