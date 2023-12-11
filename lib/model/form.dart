import 'loadable.dart';

class Form extends Loadable {
  Form({
    required int id,
    required this.name,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
}