import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:rick_morty/features/characters/domain/entities/character.dart';

class CharacterModel extends HiveObject {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationModel origin;
  LocationModel location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromEntity(Character character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      type: character.type,
      gender: character.gender,
      origin: LocationModel.fromEntity(character.origin),
      location: LocationModel.fromEntity(character.location),
      image: character.image,
      episode: character.episode,
      url: character.url,
      created: character.created,
    );
  }

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toEntity(),
      location: location.toEntity(),
      image: image,
      episode: episode,
      url: url,
      created: created,
    );
  }
  
  factory CharacterModel.fromJson(Map<dynamic, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}

class LocationModel {
  String name;
  String url;

  LocationModel({required this.name, required this.url});

  factory LocationModel.fromEntity(Location location) {
    return LocationModel(
      name: location.name,
      url: location.url,
    );
  }

  Location toEntity() {
    return Location(
      name: name,
      url: url,
    );
  }
  
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}