import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/base/use_case.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/rick_and_morty_repository.dart';
import 'package:get_it/get_it.dart';

class GetAllCharacters implements UseCase<PagedResult<Character>> {
  final int page;

  GetAllCharacters(this.page);

  @override
  Future<ApiResponse<PagedResult<Character>>> run() =>
      GetIt.I<RickAndMortyRepository<Character>>().getAll(page);
}
