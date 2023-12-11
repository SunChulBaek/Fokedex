import 'lang_value.dart';
import '../../model/form.dart';
import '../../util/converter.dart';
import '../../data/model/network_pokemon_form.dart';

class FormEntity {
  FormEntity({
    required this.id,
    required this.names
  });

  final int id;
  final List<LangValue> names;

  factory FormEntity.fromNetworkModel(
    NetworkPokemonForm form
  ) => FormEntity(
    id: form.id,
    names: form.formNames.map((e) => LangValue(
      lang: e.language.name,
      value: e.name
    )).toList()
  );

  Form asExternalModel({
    bool fromDB = false
  }) => Form(
    id: id,
    name: getNameForLocale2(names),
    fromDB: fromDB
  );
}