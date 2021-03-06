import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/base/use_case.dart';
import 'package:flutter_interview_test/data/repositories/character_repository.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/character_repository.dart';

class GetAllCharacters implements UseCase<PagedResult<Character>> {
  final CharacterRepository repository;
  final int page;

  GetAllCharacters({
    this.repository = const CharacterRepositoryImpl(),
    this.page = 1,
  });

  @override
  Future<ApiResponse<PagedResult<Character>>> run() async =>
      repository.getAll(page);
}
