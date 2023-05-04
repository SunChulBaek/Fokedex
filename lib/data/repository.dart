import 'package:flutter_template/data/model/network_named_api_resource_list.dart';
import 'package:flutter_template/data/rest_client.dart';
import 'package:injectable/injectable.dart';

import 'model/network_pokemon.dart';

@injectable
class Repository {
  Repository(this._restClient);

  final RestClient _restClient;

  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => _restClient.getPokemonList(limit: limit, offset: offset);

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => _restClient.getPokemon(id: id);
}