import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';

class CartWidgetIndicator extends StatelessWidget {
  const CartWidgetIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<BooksProvider>(
        builder: ((context, BooksProvider providerModel, child) => Badge(
              position: BadgePosition.topEnd(),
              showBadge: providerModel.selected.isNotEmpty,
              badgeContent: Text(providerModel.selected.length.toString()),
              badgeColor: Theme.of(context).colorScheme.primary,
              animationDuration: const Duration(milliseconds: 350),
              child: const Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
