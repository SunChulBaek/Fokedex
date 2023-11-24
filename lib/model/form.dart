import 'package:flutter_template/model/lang_value.dart';

import 'loadable.dart';

class Form extends Loadable {
  Form({
    required int id,
    required this.names,
    bool fromDB = false,
  }) : super(id, fromDB);

  final List<LangValue> names;
}