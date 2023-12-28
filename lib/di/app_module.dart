import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

import '../data/pokemon_data_source.dart';
import '../data/pokemon_local_data_source.dart';
import '../data/pokemon_remote_data_source.dart';
import '../data/pokemon_repository.dart';
import '../data/rest_client.dart';
import '../database/dao/evolution_chain_dao.dart';
import '../database/dao/form_dao.dart';
import '../database/dao/pokemon_dao.dart';
import '../database/dao/pokemon_item_dao.dart';
import '../database/dao/species_dao.dart';
import '../database/dao/type_dao.dart';

@module
abstract class AppModule {
  @singleton
  EventBus get eventBus => EventBus();

  @singleton
  PokemonRepository repository(
    @Named("remote") PokemonDataSource remote,
    @Named("local") PokemonDataSource local,
  ) => PokemonRepository(remote, local);

  @Injectable(as: PokemonDataSource)
  @Named("remote")
  PokemonRemoteDataSource remote(
    RestClient client
  ) => PokemonRemoteDataSource(client);

  @Injectable(as: PokemonDataSource)
  @Named("local")
  PokemonLocalDataSource local(
    EvolutionChainDao ecDao,
    FormDao formDao,
    PokemonDao pokemonDao,
    PokemonItemDao pokemonItemDao,
    SpeciesDao speciesDao,
    TypeDao typeDao,
  ) => PokemonLocalDataSource(
      ecDao,
      formDao,
      pokemonDao,
      pokemonItemDao,
      speciesDao,
      typeDao
  );

  @injectable
  EvolutionChainDao ecDao() => EvolutionChainDao();

  @injectable
  FormDao formDao() => FormDao();

  @injectable
  PokemonDao pokemonDao() => PokemonDao();

  @injectable
  PokemonItemDao pokemonItemDao() => PokemonItemDao();

  @injectable
  SpeciesDao speciesDao() => SpeciesDao();

  @injectable
  TypeDao typeDao() => TypeDao();
}