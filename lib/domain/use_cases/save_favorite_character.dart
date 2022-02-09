import 'package:flutter_interview_test/infra/drivers/local_storage_driver.dart';

class SaveFavoriteCharacter {
  final LocalStorageDriver localStorageDriver;
  final int id;

  SaveFavoriteCharacter(
      {required this.id, this.localStorageDriver = const LocalStorageDriver()});

  Future<bool> run(bool currentValue) async {
    return await localStorageDriver.saveLocalBool(id.toString(), !currentValue);
  }
}
