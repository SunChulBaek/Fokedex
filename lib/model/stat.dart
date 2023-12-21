import 'loadable.dart';

class Stat extends Loadable {
  Stat({
    required int id,
    required this.name,
    required this.value,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final int value;
}