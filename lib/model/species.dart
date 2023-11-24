import 'package:flutter_template/model/lang_value_version.dart';

import 'loadable.dart';

class Species extends Loadable {
  Species({
    required int id,
    required this.flavorTexts,
    bool fromDB = false,
  }) : super(id, fromDB);

  final List<LangValueVersion> flavorTexts;
}