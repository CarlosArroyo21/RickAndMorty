import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';
import 'package:rick_morty/features/characters/presentation/widgets/appbar.dart';
import 'package:rick_morty/features/characters/presentation/widgets/character_status.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character characterDetails;
  const CharacterDetailsScreen({super.key, required this.characterDetails});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GlassmorphicAppBar(
          appBarHeight: 70,
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              'lib/assets/images/logo.png',
              width: 200,
              height: 300,
            ),
            backgroundColor: Colors.transparent, // Semi-transparente
            elevation: 0,
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
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
            Positioned(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 29, 39),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              characterDetails.image,
                              width: 150,
                              height: 150,
                            ),
                          )),
                      Positioned.fill(
                          top: 90,
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Character's name
                                Text(
                                  characterDetails.name,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                //Character's status
                                Wrap(spacing: 30, children: [
                                  CharacterStatus(
                                    characterText: characterDetails.gender,
                                    characterStatusType:
                                        CharacterStatusType.gender,
                                    scale: 1.2,
                                  ),
                                  CharacterStatus(
                                    characterText: characterDetails.status,
                                    characterStatusType:
                                        CharacterStatusType.status,
                                    scale: 1.2,
                                  ),
                                ]),
                                // const SizedBox(height: 30),
                                //Character's origin and location
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Origin
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.public,
                                                    color: Colors.grey,
                                                    size: 25),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  width: 15,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                const Text('Origin',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            width: constraints.maxWidth * 0.4,
                                            height: 20,
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.contain,
                                              child: Text(
                                                  characterDetails.origin.name,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ),
                                        ]),
                                    //Location
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.public,
                                                    color: Colors.grey,
                                                    size: 25),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  width: 15,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                const Text('Location',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            width: constraints.maxWidth * 0.4,
                                            height: 20,
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.contain,
                                              child: Text(
                                                characterDetails.location.name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ])
                                  ],
                                ),
                                //Character's species and type (subspecies)
                                // const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Species
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  'lib/assets/icons/species.svg',
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.grey,
                                                          BlendMode.srcIn),
                                                  height: 25,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  width: 15,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                const Text('Specie',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            width: constraints.maxWidth * 0.4,
                                            height: 20,
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.contain,
                                              child: Text(
                                                  characterDetails.species,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ),
                                        ]),
                                    //Type (subspecies)
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  'lib/assets/icons/species.svg',
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Colors.grey,
                                                          BlendMode.srcIn),
                                                  height: 25,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  width: 15,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                const Text('Subspecie',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            width: constraints.maxWidth * 0.4,
                                            height: 20,
                                            child: FittedBox(
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.contain,
                                              child: Text(
                                                characterDetails.type.isEmpty
                                                    ? 'N/A'
                                                    : characterDetails.type,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ])
                                  ],
                                ),
                                // const SizedBox(height: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                          'Episodes ( ${characterDetails.episode.length} )',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      color:
                                          const Color.fromARGB(255, 19, 22, 29),
                                      height: 80,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            characterDetails.episode.length,
                                        itemBuilder: (context, index) {
                                          final episodeNumber = characterDetails
                                              .episode[index]
                                              .split('/')
                                              .last;

                                          return Container(
                                            margin: const EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.greenAccent,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  255, 26, 29, 39),
                                            ),
                                            width: 60,
                                            child: Text(
                                              episodeNumber,
                                              style: const TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        ));
  }
}
