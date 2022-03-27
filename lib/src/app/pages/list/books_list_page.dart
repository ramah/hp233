import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/list/book_widget.dart';
import 'package:rgehenrypoitier/src/app/pages/list/search_widget.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const SearchWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: const CartWidgetIndicator(),
              onTap: () {
                Navigator.of(context).pushNamed("cart");
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      body: Consumer<BooksProvider>(
        builder:
            (BuildContext context, BooksProvider bookProvider, Widget? child) {
          if (bookProvider.booksLoaded == false) {
            return const Center(
              child:
                  CircularProgressIndicator(color: Colors.red, strokeWidth: 4),
            );
          }
          return bookProvider.isSearching
              ? ListView.builder(
                  itemCount: bookProvider.searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookWidget(
                      book: bookProvider.searchResult[index],
                      alreadyInCart: bookProvider.selected.isNotEmpty &&
                          bookProvider.selected
                              .contains(bookProvider.searchResult[index]),
                    );
                  })
              : ListView.builder(
                  itemCount: bookProvider.books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookWidget(
                      book: bookProvider.books[index],
                      alreadyInCart: bookProvider.selected.isNotEmpty &&
                          bookProvider.selected
                              .contains(bookProvider.books[index]),
                    );
                  },
                );
        },
      ),
    );
  }
}
