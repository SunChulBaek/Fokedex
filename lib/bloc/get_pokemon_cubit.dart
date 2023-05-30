import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/repository.dart';
import '../ui/model/ui_pokemon_detail.dart';
import '../ui/model/ui_stat.dart';
import '../ui/model/ui_type.dart';
import '../util/converter.dart';
import '../util/timber.dart';
import 'model/ui_state.dart';

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  UiPokemonDetail? _detail;

  void init(int id) async {
    try {
      final pokemon = await _repository.getPokemon(id: id);
      _detail = UiPokemonDetail(
        id: pokemon.id,
        name: pokemon.name,
        flavorText: "",
        types: pokemon.types.map((e) =>
          UiType(id: getIdFromUrl(e.type.url), name: e.type.name)
        ).toList(),
        weight: pokemon.weight,
        height: pokemon.height,
        stats: pokemon.stats.map((e) =>
          UiStat(
            name: e.stat.name,
            value: e.baseStat
          )
        ).toList()
      );
      emit(Success(data: _detail!));

      // Species (이름)
      _repository.getSpecies(
        id: getIdFromUrl(pokemon.species.url)
      ).then((species) {
        _detail = _detail?.copyWith(
          name: species.names.firstWhere((e) => e.language.name == 'ko').name,
          flavorText: species.flavorTextEntries.firstWhere((e) => e.language.name == 'ko').flavorText.replaceAll("\n", " ")
        );
        emit(Success(data: _detail!));
      });

      // Type
      final types = List<UiType>.of([]);
      for (var type in pokemon.types) {
        _repository.getType(
          id: getIdFromUrl(type.type.url)
        ).then((value) {
          int idx = value.id;
          String typeInLocale = value.names
            .firstWhere((e) => e.language.name == 'ko')
            .name;
          types.add(UiType(id: idx, name: typeInLocale));
          _detail = _detail?.copyWith(types: types);
          emit(Success(data: _detail!));
          }
        );
      }
    } catch (e) {
      Timber.e(e);
      emit(Error());
    }
  }
}