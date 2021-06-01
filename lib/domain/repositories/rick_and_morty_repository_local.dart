abstract class FavoriteCharacterRepository {
  Future<void> save(String id);
  Future<List<String>> getAll();
}
