import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String content;
  const AppTitle({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style:  TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
