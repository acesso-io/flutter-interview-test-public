import 'package:flutter_interview_test/data/repositories/character_repository.dart';
import 'package:flutter_interview_test/domain/repositories/character_repository.dart';

class SetCharAsFavorite {
  final CharacterRepository repository;

  factory SetCharAsFavorite.injected() {
    return SetCharAsFavorite(CharacterRepositoryImpl.injected());
  }

  SetCharAsFavorite(this.repository);

  Future<void> run(int id, bool isFavorite) async {
    if (isFavorite) {
      await repository.removeFavorite(id);
    } else {
      await repository.addFavorite(id);
    }
  }
}
