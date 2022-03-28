import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/cart/cart_item_widget.dart';
import 'package:rgehenrypoitier/src/app/providers/books_best_offers_provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_title.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookBestOfferProvider>(
      builder: (BuildContext context, BookBestOfferProvider offerProvider,
          Widget? child) {
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              const AppTitle(content: "Panier"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Book bk = Provider.of<BooksProvider>(context, listen: false)
                      .selected[index];
                  return CartItemWidget(
                    label: bk.title,
                    price: bk.price.toString(),
                  );
                },
                itemCount: Provider.of<BooksProvider>(context, listen: false)
                    .selected
                    .length,
              ),
              const Divider(
                height: 24.0,
              ),
              CartItemWidget(
                label: "Total:",
                price: offerProvider.cartTotal.toString(),
              ),
              CartItemWidget(
                label: "Reduction:",
                price: "-${offerProvider.cartDiscount.toString()}",
              ),
              CartItemWidget(
                label: "A Payer:",
                price: offerProvider.cartFinalTotal.toString(),
              ),
              const Divider(
                thickness: 3.0,
                height: 24.0,
              ),
              Text(
                "Et la meilleure offre est: ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Visibility(
                visible: !offerProvider.loadingOffer,
                replacement: const LinearProgressIndicator(),
                child: ListTile(
                  title: Text(
                    offerProvider.bestSelectedOffer == null
                        ? ""
                        : offerProvider.bestSelectedOffer.toString(),
                  ),
                  subtitle: Text(
                    offerProvider.bestSelectedOffer == null
                        ? ""
                        : offerProvider.bestSelectedOffer!.type.toString(),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<BooksProvider>().emptyCart();
                    context.read<BookBestOfferProvider>().reset();
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Vider le panier"),
                  ))
            ],
          ),
        );
      },
    );
  }
}
