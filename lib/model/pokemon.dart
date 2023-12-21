import 'loadable.dart';

class Pokemon extends Loadable {
  Pokemon({
    required int id,
    required this.name,
    required this.imageUrl,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final String imageUrl;
}