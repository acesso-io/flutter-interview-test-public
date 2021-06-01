abstract class FavoriteCharacterService {
  Future<void> save(int? id);
  Future<List<int>> getAll();
}
