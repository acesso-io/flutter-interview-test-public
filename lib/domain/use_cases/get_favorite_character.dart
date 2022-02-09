import 'package:flutter_interview_test/infra/drivers/local_storage_driver.dart';

class GetFavoriteCharacter {
  final LocalStorageDriver localStorageDriver;
  final int id;

  GetFavoriteCharacter(
      {required this.id, this.localStorageDriver = const LocalStorageDriver()});

  Future<bool> run() async {
    return await localStorageDriver.getLocalBool(id.toString()) ?? false;
  }
}
