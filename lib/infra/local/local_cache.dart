import 'dart:convert';

import 'package:flutter_interview_test/domain/entities/favorite.dart';
import 'package:localstorage/localstorage.dart';

abstract class LocalCache<T> {
  T getData();

  Future<void> setData(T data);
}

class FavoriteCacheImpl implements LocalCache<List<Favorite>> {
  static final String _FAVORITE_KEY = 'FAVORITE_KEY';
  static final String _LOCAL_STORAGE_KEY = 'LOCAL_STORAGE_KEY';
  final LocalStorage _localStorage;

  factory FavoriteCacheImpl.injected() {
    return FavoriteCacheImpl(LocalStorage(_LOCAL_STORAGE_KEY));
  }

  FavoriteCacheImpl(this._localStorage);

  @override
  List<Favorite> getData() {
    var favoritesJson = _localStorage.getItem(_FAVORITE_KEY) ?? '[]';
    var favorites = <Favorite>[];
    jsonDecode(favoritesJson)?.forEach((favoriteJson) {
      favorites.add(Favorite.fromJson(favoriteJson));
    });

    return favorites;
  }

  @override
  Future<void> setData(List<Favorite> data) async =>
      await _localStorage.setItem(_FAVORITE_KEY, jsonEncode(data));
}
