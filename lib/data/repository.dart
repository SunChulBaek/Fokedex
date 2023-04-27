import 'package:flutter_template/data/model/pokemon.dart';
import 'package:flutter_template/data/model/response2.dart';
import 'package:flutter_template/data/rest_client.dart';
import 'package:injectable/injectable.dart';

import 'model/pokemon_detail.dart';

@injectable
class Repository {
  Repository(this._restClient);

  final RestClient _restClient;

  Future<Response2<List<Pokemon>>> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => _restClient.getPokemonList(limit: limit, offset: offset);

  Future<PokemonDetail> getPokemon({
    required int id
  }) => _restClient.getPokemon(id: id);
}