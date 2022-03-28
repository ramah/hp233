import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/list/book_widget.dart';
import 'package:rgehenrypoitier/src/app/pages/list/search_widget.dart';
import 'package:rgehenrypoitier/src/app/providers/books_best_offers_provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_title.dart';
import 'package:rgehenrypoitier/src/app/widgets/cart_widget_indicator.dart';

class BooksListPage extends StatefulWidget {
  const BooksListPage({Key? key}) : super(key: key);

  @override
  State<BooksListPage> createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  @override
  void didChangeDependencies() {
    if (!Provider.of<BooksProvider>(context).booksLoaded) {
      Provider.of<BooksProvider>(context).getBooks();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder:
          (BuildContext context, BooksProvider bookProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const AppTitle(content: "Liste des livres"),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  child: const CartWidgetIndicator(),
                  onTap: () {
                    if (bookProvider.selected.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Votre panier est vide",
                        ),
                      ));
                    } else {
                      context
                          .read<BookBestOfferProvider>()
                          .populateBooks(bookProvider.selected);
                      Navigator.of(context).pushNamed("cart");
                    }
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade50,
          body: Consumer<BooksProvider>(
            builder: (BuildContext context, BooksProvider bookProvider,
                Widget? child) {
              if (bookProvider.booksLoaded == false) {
                return const Center(
                  child: CircularProgressIndicator(
                      color: Colors.red, strokeWidth: 4),
                );
              }
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchWidget(),
                  ),
                  Expanded(
                    child: bookProvider.isSearching
                        ? ListView.builder(
                            itemCount: bookProvider.searchResult.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BookWidget(
                                book: bookProvider.searchResult[index],
                                alreadyInCart:
                                    bookProvider.selected.isNotEmpty &&
                                        bookProvider.selected.contains(
                                            bookProvider.searchResult[index]),
                              );
                            })
                        : ListView.builder(
                            itemCount: bookProvider.books.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BookWidget(
                                book: bookProvider.books[index],
                                alreadyInCart: bookProvider
                                        .selected.isNotEmpty &&
                                    bookProvider.selected
                                        .contains(bookProvider.books[index]),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
