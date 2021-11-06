import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String key = 'favorites';
  static List<int> myFavorites = [];

  static Future<void> setFavoriteCharacter({
    required String id,
  }) async {
    var prefs = await SharedPreferences.getInstance();

    var favorites = prefs.getStringList(key) ?? [];
    favorites.contains(id) ? favorites.remove(id) : favorites.add(id);

    await prefs.setStringList(key, favorites);
    myFavorites = _convertStringToInt(favorites);
  }

  static Future<void> searchFavorites() async {
    var prefs = await SharedPreferences.getInstance();
    var favorites = prefs.getStringList(key) ?? [];
    myFavorites = _convertStringToInt(favorites);
  }

  static List<int> _convertStringToInt(List<String> favorites) =>
      favorites.map(int.parse).toList();
}
