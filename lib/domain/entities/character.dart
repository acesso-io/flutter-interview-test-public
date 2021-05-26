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
      );
}
