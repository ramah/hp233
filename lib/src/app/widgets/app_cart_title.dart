import 'package:flutter/material.dart';

class CartBookTitle extends StatelessWidget {
  final String content;
  const CartBookTitle({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
