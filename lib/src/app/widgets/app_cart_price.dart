import 'package:flutter/material.dart';

class AppCartPrice extends StatelessWidget {
  final String content;
  const AppCartPrice({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
