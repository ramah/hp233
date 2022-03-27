import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/cart/cart_page.dart';
import 'package:rgehenrypoitier/src/app/pages/list/books_list_page.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/services/http_book_service.dart';
import 'package:rgehenrypoitier/src/services/http_service.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<HttpService>(HttpService());
  getIt.registerSingleton<HttpBookService>(HttpBookService());

  runApp(ChangeNotifierProvider<BooksProvider>(
    create: (_) => BooksProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => const BooksListPage(),
        'cart': (BuildContext context) => const CartPage(),
      },
      title: 'RGE Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
