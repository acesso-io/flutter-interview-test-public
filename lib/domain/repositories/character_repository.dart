import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import '../entities/favorite.dart';

abstract class CharacterRepository {
  Future<ApiResponse<PagedResult<Character>>> getAll(int page);
  List<Favorite> getFavorites();
  Future<void> addFavorite(int id);
  Future<void> removeFavorite(int id);
}
