import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/core/resources/types.dart';

abstract class RickAndMortyRepository<T> {
  Future<ApiResponse<PagedResult<T>>> filterResults(JsonObject filter);
  Future<ApiResponse<PagedResult<T>>> getAll(int page);
  Future<ApiResponse<List<T>>> getList(List<int> ids);
  Future<ApiResponse<T>> get(int id);
}
