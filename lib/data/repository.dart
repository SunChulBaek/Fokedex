import 'package:flutter_template/data/model/pokemon.dart';
import 'package:flutter_template/data/model/response2.dart';
import 'package:flutter_template/data/rest_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class Repository {
  Repository(this._restClient);

  final RestClient _restClient;

  Future<Response2<List<Pokemon>>> getPokemonList() => _restClient.getPokemonList();
}