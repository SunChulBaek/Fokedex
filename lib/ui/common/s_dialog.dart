import 'dart:async';

import 'package:flutter/material.dart';

typedef SDialogButtonCallback<T> = void Function(T?);

typedef SDialogFutureCallback<T, R> = FutureOr<R> Function(T?);

class SDialogLoginData {
  const SDialogLoginData({
    required this.username,
    required this.password
  });
  final String username;
  final String password;
}

class _SDialogData<T> {
  _SDialogData({
    required this.result,
    this.data,
  });
  final String result;
  final T? data;
}

class SDialog<T> extends StatefulWidget {
  static const _resultPositive = "positive";
  static const _resultNegative = "negative";
  static const activeColorForChoice = Colors.cyan;

  const SDialog({
    this.title,
    this.content,
    this.choices,
    this.init,
    this.activeColor,
    this.inactiveColor,
    this.positiveButton,
    this.negativeButton,
    this.onClickPositive,
    this.onClickNegative,
    this.isIdPw,
    super.key
  });

  final String? title;
  final Widget? content;

  // choice
  final List<String>? choices;
  final int? init;
  final Color? activeColor;
  final Color? inactiveColor;

  // id, pw
  final bool? isIdPw;

  final String? positiveButton;
  final String? negativeButton;
  final SDialogButtonCallback<T>? onClickPositive;
  final SDialogButtonCallback<T>? onClickNegative;

  @override
  State<StatefulWidget> createState() => _SDialogState();

  void show(BuildContext context) => showDialog<_SDialogData<T>>(
      context: context,
      builder: (context) => this
  ).then((value) {
    if (value?.result == _resultPositive) {
      return onClickPositive?.call(value?.data);
    } else if (value?.result == _resultNegative) {
      return onClickNegative?.call(value?.data);
    }
  });

  Future<R> showThen<R>({
    required BuildContext context,
    SDialogFutureCallback<T, R>? onFuturePositive,
    SDialogFutureCallback<T, R>? onFutureNegative,
  }) => showDialog(
      context: context,
      builder: (context) => this
  ).then((value) {
    if (value?.result == _resultPositive && onFuturePositive != null) {
      return onFuturePositive(value?.data);
    } else if (value?.result == _resultNegative && onFutureNegative != null) {
      return onFutureNegative(value?.data);
    } else {
      return Future.value(value);
    }
  });
}

class _SDialogState extends State<SDialog> {
  int? _index;
  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _index = widget.init;
    });
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    title: widget.title != null ? Text(widget.title!) : null,
    content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.content != null)
            widget.content!,
          for (int i = 0; i < (widget.choices?.length ?? 0); i++)
            TextButton(
                onPressed: () {
                  setState(() {
                    _index = i;
                  });
                },
                child: Text(
                    widget.choices![i],
                    style: TextStyle(
                        color: i == (_index ?? 0)
                            ? (widget.activeColor ?? SDialog.activeColorForChoice)
                            : widget.inactiveColor
                    )
                )
            ),
          if (widget.isIdPw ?? false)
            TextField(
              decoration: const InputDecoration(
                  hintText: "사용자 이름"
              ),
              onChanged: (text) {
                setState(() { _username = text; });
              },
            ),
          if (widget.isIdPw ?? false)
            TextField(
              decoration: const InputDecoration(
                  hintText: "비밀번호"
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              onChanged: (text) {
                setState(() { _password = text; });
              },
            ),
        ]
    ),
    actions: [
      if (widget.negativeButton != null)
        TextButton(
            child: Text(widget.negativeButton!),
            onPressed: () {
              Navigator.pop(
                  context,
                  _SDialogData(
                    result: SDialog._resultNegative,
                  )
              );
            }
        ),
      if (widget.positiveButton != null)
        TextButton(
            child: Text(widget.positiveButton!),
            onPressed: () {
              Navigator.pop(
                  context,
                  _SDialogData(
                      result: SDialog._resultPositive,
                      data: (widget.isIdPw ?? false)
                          ? SDialogLoginData(username: _username, password: _password)
                          : _index
                  )
              );
            }
        ),
    ],
  );
}