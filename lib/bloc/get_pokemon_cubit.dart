import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/repository.dart';
import '../ui/model/ui_pokemon_detail.dart';
import '../ui/model/ui_stat.dart';
import '../ui/model/ui_type.dart';
import '../util/timber.dart';
import 'model/ui_state.dart';

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  void init(int id) async {
    try {
      final pokemon = await _repository.getPokemon(id: id);
      return emit(
        Success(
          data: UiPokemonDetail(
            id: pokemon.id,
            name: pokemon.name,
            types: pokemon.types.map((e) =>
              UiType.values.byName(e.type.name)
            ).toList(),
            weight: pokemon.weight,
            height: pokemon.height,
            stats: pokemon.stats.map((e) =>
              UiStat(
                name: e.stat.name,
                value: e.baseStat
              )
            ).toList()
          )
        )
      );
    } catch (e) {
      Timber.e(e);
      emit(Error());
    }
  }
}