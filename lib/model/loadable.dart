abstract class Loadable {
  Loadable(
    this.id,
    this.fromDB,
  );

  final int id;
  final bool fromDB;
}