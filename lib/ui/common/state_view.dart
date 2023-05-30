import 'package:flutter/material.dart';

import '../../bloc/model/ui_state.dart';
import 'error.dart';
import 'loading.dart';

class StateView extends StatelessWidget {
  const StateView({
    required this.state,
    this.child,
    super.key
  });

  final UiState state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const LoadingScreen();
    } else if (state.isSuccess) {
      return child!;
    } else {
      return const ErrorScreen();
    }
  }
}