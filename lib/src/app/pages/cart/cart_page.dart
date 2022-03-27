import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [

          
          ElevatedButton(
              onPressed: () {
                Provider.of<BooksProvider>(context, listen: false).emptyCart();
              },
              child: Text("Vider le panier"))
        ],
      ),
    );
  }
}
