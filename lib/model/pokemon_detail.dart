import 'package:freezed_annotation/freezed_annotation.dart';

import 'evolution_chain.dart';
import 'form.dart';
import 'species.dart';
import 'stat.dart';
import 'type.dart';

part 'pokemon_detail.freezed.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  factory PokemonDetail({
    int? id,
    String? name,
    int? weight,
    int? height,
    List<Stat>? stats,
    List<int>? varietyIds,
    // species
    int? speciesId, // for progress
    Species? species,
    // form
    int? formId, // for progress
    Form? form,
    // type
    List<int>? totalTypeIds, // for progress
    List<Type>? types,
    // evolution chain
    int? evolutionChainId, // for progress
    EvolutionChain? evolutionChain, // TODO
  }) = _PokemonDetail;
}