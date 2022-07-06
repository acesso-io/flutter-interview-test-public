import 'package:flutter_interview_test/domain/entities/location.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? imageUrl;
  List<String>? episodesUrl;
  String? characterUrl;
  DateTime? created;
  bool? favorite;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.imageUrl,
    this.episodesUrl,
    this.characterUrl,
    this.created,
    this.favorite
  });

  static Character fromJson(dynamic json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status']?.toString().toLowerCase(),
        species: json['species'],
        type: json['type'],
        gender: json['gender']?.toString().toLowerCase(),
        origin:
            json['origin'] != null ? Location.fromJson(json['origin']) : null,
        location: json['location'] != null
            ? Location.fromJson(json['location'])
            : null,
        imageUrl: json['image'],
        episodesUrl: json['episode']?.cast<String>(),
        characterUrl: json['url'],
        created: DateTime.tryParse(json['created']),
        favorite: json['favorite'] != null ? true : false
      );
}

class Status {
  static const String alive = 'alive';
  static const String dead = 'dead';
  static const String unknown = 'unknown';
}

class Gender {
  static const String female = 'female';
  static const String male = 'male';
  static const String genderless = 'genderless';
  static const String unknown = 'unknown';
}
