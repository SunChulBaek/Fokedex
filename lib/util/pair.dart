class Pair<X, Y> {
  Pair(
    this.first,
    this.second
  );
  late X first;
  late Y second;

  Pair<X, Y> copy({
    X? first,
    Y? second
  }) => Pair(
    first ?? this.first,
    second ?? this.second
  );
}