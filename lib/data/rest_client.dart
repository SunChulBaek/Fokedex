import 'package:dio/dio.dart';
import 'package:flutter_template/data/model/network_named_api_resource_list.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/http.dart';

import 'model/network_pokemon.dart';

part 'rest_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://pokeapi.co/api/v2/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  factory RestClient.from(Dio dio) => RestClient(dio);

  @GET('pokemon')
  Future<NetworkNamedAPIResourceList> getPokemonList({
    @Query("limit") int limit = 20,
    @Query("offset") int offset = 0,
  });

  @GET('pokemon/{id}')
  Future<NetworkPokemon> getPokemon({
    @Path('id') required int id
  });
}

DateTime? dateTimeFromString(String? text) {
  if (text != null) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(text);
  } else {
    return null;
  }
}