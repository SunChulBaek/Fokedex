import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 72, color: Colors.red),
          Text('에러가 발생하였습니다.', style: TextStyle(color: Colors.red, fontSize: 16))
        ]
      )
    );
  }
}