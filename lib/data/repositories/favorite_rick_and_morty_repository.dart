import 'package:flutter_interview_test/domain/repositories/rick_and_morty_repository_local.dart';

import 'package:shared_preferences/shared_preferences.dart';

const String FAVORITE_PREFERENCES_KEY = 'favorite_saved';

class FavoriteCharacterRepositoryImpl implements FavoriteCharacterRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<List<String>> getAll() async {
    final prefs = await _prefs;
    prefs.getStringList(FAVORITE_PREFERENCES_KEY);
  }

  @override
  Future<void> save(String id) async {
    final prefs = await _prefs;
    var favoriteList = await getAll();
    favoriteList!.add(id);
    await prefs.setStringList(FAVORITE_PREFERENCES_KEY, favoriteList);
  }
}
