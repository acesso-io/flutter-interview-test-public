import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/base/use_case.dart';
import 'package:flutter_interview_test/data/repositories/character_repository.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/character_repository.dart';

import 'get_all_characters_use_case.dart';

class GetAllCharactersWithFavorites implements UseCase<PagedResult<Character>> {
  final CharacterRepository repository;
  final int page;
  final GetAllCharacters getAllCharacters;

  factory GetAllCharactersWithFavorites.injected() {
    return GetAllCharactersWithFavorites(
        CharacterRepositoryImpl.injected(), GetAllCharacters.injected());
  }

  GetAllCharactersWithFavorites(this.repository, this.getAllCharacters,
      {this.page = 1});

  @override
  Future<ApiResponse<PagedResult<Character>>> run() async {
    var result = await getAllCharacters.run();
    var favorites = repository.getFavorites();
    result.data?.results?.forEach((character) {
      character.favorite =
          favorites.any((favorite) => character.id == favorite.id);
    });

    return result;
  }
}
