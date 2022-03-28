import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(book.title),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: book.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(book.synopsis[index]),
                );
              },
              itemCount: book.synopsis.length,
            ),
          ),
        )
      ]),
    );
  }
}
