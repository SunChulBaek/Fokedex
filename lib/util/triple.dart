class Triple<X, Y, Z> {
  Triple(
    this.first,
    this.second,
    this.third
  );
  late X first;
  late Y second;
  late Z third;

  Triple<X, Y, Z> copy({
    X? first,
    Y? second,
    Z? third
  }) => Triple(
    first ?? this.first,
    second ?? this.second,
    third ?? this.third
  );
}