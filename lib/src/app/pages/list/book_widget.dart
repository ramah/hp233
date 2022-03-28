import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/detail/book_detail.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final bool alreadyInCart;
  const BookWidget({Key? key, required this.book, required this.alreadyInCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BookDetail(
            book: book,
          ),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: book.cover,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        book.isbn,
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
              ),
              Column(
                children: [
                  Chip(label: Text(book.price.toString())),
                  alreadyInCart
                      ? IconButton(
                          onPressed: (() {
                            context
                                .read<BooksProvider>()
                                .removeBookFromCart(book);
                          }),
                          icon: const Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: 40,
                            color: Colors.red,
                          ),
                        )
                      : IconButton(
                          onPressed: (() {
                            context.read<BooksProvider>().addBookToCart(book);
                          }),
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 40,
                            color: Colors.green,
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
