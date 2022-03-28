import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);
// will call the provider
  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(
              Icons.search,
            ),
          ),
          onChanged: (value) {
            context.read<BooksProvider>().search(value);
          },
        ))
      ],
    );
  }
}
