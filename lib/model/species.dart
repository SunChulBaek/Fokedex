import 'loadable.dart';

class Species extends Loadable {
  Species({
    required int id,
    required this.name,
    required this.flavorText,
    required this.ecId,
    required this.vIds,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final String flavorText;
  final int? ecId;
  final List<int>? vIds;
}