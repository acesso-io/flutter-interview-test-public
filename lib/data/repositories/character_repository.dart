import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/endpoints.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/favorite.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/character_repository.dart';
import 'package:flutter_interview_test/infra/drivers/http_driver.dart';
import 'package:flutter_interview_test/infra/local/local_cache.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final LocalCache _localCache;

  factory CharacterRepositoryImpl.injected() {
    return CharacterRepositoryImpl(FavoriteCacheImpl.injected());
  }

  CharacterRepositoryImpl(this._localCache);

  @override
  Future<ApiResponse<PagedResult<Character>>> getAll(int page) =>
      HttpDriver(Endpoints.baseUrl).request<PagedResult<Character>>(
        method: HttpMethod.GET,
        endpoint: Endpoints.character,
        queryParams: {'page': page},
        mapper: (dynamic json) =>
            PagedResult.fromJson<Character>(json, Character.fromJson),
      );

  @override
  List<Favorite> getFavorites() => _localCache.getData();

  @override
  Future<void> addFavorite(int id) async {
    var favoriteList = getFavorites();
    favoriteList.add(Favorite(id: id));
    await _localCache.setData(favoriteList);
  }

  @override
  Future<void> removeFavorite(int id) async {
    var favoriteList = getFavorites();
    favoriteList.removeWhere((favorite) => favorite.id == id);
    await _localCache.setData(favoriteList);
  }
}
