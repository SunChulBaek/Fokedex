import 'package:injectable/injectable.dart';

@injectable
abstract class UiState {
  UiState({
    required this.value,
  });

  final int value;

  bool get isLoading => value == 0;
  bool get isError => value == 1;
  bool get isSuccess => value == 2;

  @factoryMethod
  factory UiState.from() => Loading();
}

class Loading extends UiState {
  Loading() : super(value: 0);
}

class Error extends UiState {
  Error() : super(value: 1);
}

class Success<T> extends UiState {
  Success({
    required this.data,
  }) : super(value: 2);

  final T data;
}