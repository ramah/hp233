import 'package:flutter/material.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_cart_price.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_cart_title.dart';

class CartItemWidget extends StatelessWidget {
  final String label;
  final String price;
  const CartItemWidget({Key? key, required this.label, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: CartBookTitle(
            content: label,
          ),
        ),
        Expanded(
          flex: 1,
          child: AppCartPrice(
            content: price,
          ),
        )
      ],
    );
  }
}
