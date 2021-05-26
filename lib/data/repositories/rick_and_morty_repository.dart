import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/types.dart';
import 'package:flutter_interview_test/data/drivers/http_driver.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/rick_and_morty_repository.dart';
import 'package:flutter_interview_test/infra/drivers/http_driver.dart';
import 'package:get_it/get_it.dart';

class RickAndMortyRepositoryImpl<T> implements RickAndMortyRepository<T> {
  final Mapper<T> mapper;
  final String endpoint;

  RickAndMortyRepositoryImpl(this.mapper, this.endpoint);

  @override
  Future<ApiResponse<PagedResult<T>>> filterResults(JsonObject filter) =>
      GetIt.I<HttpDriver>().request<PagedResult<T>>(
        method: HttpMethod.GET,
        endpoint: endpoint,
        queryParams: filter,
        mapper: (dynamic json) => PagedResult.fromJson<T>(json, mapper),
      );

  @override
  Future<ApiResponse<T>> get(int id) => GetIt.I<HttpDriver>().request<T>(
        method: HttpMethod.GET,
        endpoint: '$endpoint/$id',
        mapper: mapper,
      );

  @override
  Future<ApiResponse<PagedResult<T>>> getAll(int page) =>
      GetIt.I<HttpDriver>().request<PagedResult<T>>(
        method: HttpMethod.GET,
        endpoint: endpoint,
        queryParams: {'page': page},
        mapper: (dynamic json) => PagedResult.fromJson<T>(json, mapper),
      );

  @override
  Future<ApiResponse<List<T>>> getList(List<int> ids) {
    return GetIt.I<HttpDriver>().request<List<T>>(
      method: HttpMethod.GET,
      endpoint: '$endpoint/${ids.join(',')}',
      mapper: (dynamic json) =>
          (json as List).map((obj) => mapper(obj)).toList(),
    );
  }
}
