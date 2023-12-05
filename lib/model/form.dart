import '../data/model/network_pokemon_form.dart';
import '../util/converter.dart';
import 'loadable.dart';

class Form extends Loadable {
  Form({
    required int id,
    required this.name,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;

  factory Form.fromNetworkModel(
    NetworkPokemonForm form,
    {
      bool fromDB = false
    }
  ) => Form(
    id: form.id,
    name: getNameForLocale(form.formNames),
    fromDB: fromDB
  );
}