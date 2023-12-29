import 'package:floor/floor.dart';

import 'lang_value.dart';
import '../../data/model/network_type.dart';
import '../../model/type.dart';
import '../../util/converter.dart';

@Entity(
  tableName: "type",
  primaryKeys: [ "t_id" ]
)
class TypeEntity {
  TypeEntity({
    required this.id,
    required this.names
  });

  @ColumnInfo(name: "t_id") final int id;
  @ColumnInfo(name: "names") final List<LangValue> names;

  factory TypeEntity.fromNetworkModel(
    NetworkType type
  ) => TypeEntity(
    id: type.id,
    names: type.names.map((e) => LangValue(
      lang: e.language.name,
      value: e.name)
    ).toList()
  );

  Type asExternalModel({
    bool fromDB = false
  }) => Type(
    id: id,
    name: getNameForLocale2(names),
    fromDB: fromDB
  );
}