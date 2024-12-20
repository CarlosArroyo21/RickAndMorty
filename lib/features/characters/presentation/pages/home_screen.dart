import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty/core/service_locator/service_locator.dart';
import 'package:rick_morty/features/characters/presentation/mobx/character_store.dart';
import 'package:rick_morty/features/characters/presentation/widgets/appbar.dart';
import 'package:rick_morty/features/characters/presentation/widgets/character_status.dart';

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
        extendBodyBehindAppBar: true,
        appBar: GlassmorphicAppBar(
          appBar: AppBar(
            title: Image.asset(
              'lib/assets/images/logo.png',
              width: 100,
              height: 50,
            ),
            backgroundColor: Colors.black.withOpacity(0.0), // Semi-transparente
            elevation: 0,
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
                    child: characterStore.charactersList.isEmpty &&
                            characterStore.isLoading
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                          padding: const EdgeInsets.only(top: 100),
                            controller: scrollController,
                            itemCount: characterStore.charactersList.length +
                                (characterStore.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {

                              if (index ==
                                  characterStore.charactersList.length) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              return GestureDetector(
                                onTap: () => context.push('/character-details',
                                    extra:
                                        characterStore.charactersList[index]),
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
                                                  .charactersList[index].image),
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
                                                    .charactersList[index].name,
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
                                                            .charactersList[
                                                                index]
                                                            .status,
                                                    characterStatusType:
                                                        CharacterStatusType
                                                            .status,
                                                  ),
                                                  CharacterStatus(
                                                    characterText:
                                                        characterStore
                                                            .charactersList[
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
                                            icon: Icon(
                                              characterStore.isFavorite(
                                                      characterStore
                                                              .charactersList[
                                                          index])
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                            ),
                                            onPressed: () {
                                              if (characterStore.isFavorite(
                                                  characterStore
                                                      .charactersList[index])) {
                                                characterStore
                                                    .removeFavoriteCharacter(
                                                        characterStore
                                                                .charactersList[
                                                            index]);
                                              } else {
                                                characterStore
                                                    .addFavoriteCharacter(
                                                        characterStore
                                                                .charactersList[
                                                            index]);
                                              }
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
