import '../database/model/form_entity.dart';
import '../util/converter.dart';
import 'loadable.dart';

class Form extends Loadable {
  Form({
    required int id,
    required this.name,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;

  factory Form.fromEntity(
    FormEntity form,
    {
      bool fromDB = false
    }
  ) => Form(
    id: form.id,
    name: getNameForLocale2(form.names),
    fromDB: fromDB
  );
}