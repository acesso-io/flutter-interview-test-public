import './favorite_character_service.dart';

class FavoriteCharacterServiceImpl implements FavoriteCharacterService {
  List<int?> favorites = [];

  @override
  Future<List<int>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> save(int? id) async {
    await Future.delayed(Duration(milliseconds: 500));
    favorites.add(id);
  }
}
