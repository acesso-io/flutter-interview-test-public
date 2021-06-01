import 'package:flutter_interview_test/core/resources/endpoints.dart';
import 'package:flutter_interview_test/data/drivers/http_driver.dart';
import 'package:flutter_interview_test/data/repositories/rick_and_morty_repository.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/episode.dart';
import 'package:flutter_interview_test/domain/entities/location.dart';
import 'package:flutter_interview_test/domain/repositories/rick_and_morty_repository.dart';
import 'package:flutter_interview_test/domain/services/favorite_character_service.dart';
import 'package:flutter_interview_test/domain/services/favorite_character_service_impl.dart';
import 'package:flutter_interview_test/infra/drivers/http_driver.dart';
import 'package:get_it/get_it.dart';

class InjectionModule {
  static void register() {
    final di = GetIt.I;
    di.registerFactory<HttpDriver>(() => HttpDriverImpl(Endpoints.baseUrl));
    di.registerFactory<RickAndMortyRepository<Character>>(() =>
        RickAndMortyRepositoryImpl(Character.fromJson, Endpoints.character));
    di.registerFactory<RickAndMortyRepository<Location>>(() =>
        RickAndMortyRepositoryImpl(Location.fromJson, Endpoints.location));
    di.registerFactory<RickAndMortyRepository<Episode>>(
        () => RickAndMortyRepositoryImpl(Episode.fromJson, Endpoints.episode));
    di.registerFactory<FavoriteCharacterService>(
        () => FavoriteCharacterServiceImpl());
  }
}
