import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rgehenrypoitier/src/app/pages/cart/cart_page.dart';
import 'package:rgehenrypoitier/src/app/pages/list/books_list_page.dart';
import 'package:rgehenrypoitier/src/app/providers/books_best_offers_provider.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/app/utils/theming.dart';
import 'package:rgehenrypoitier/src/services/books/http_books_service.dart';
import 'package:rgehenrypoitier/src/services/http_service.dart';
import 'package:rgehenrypoitier/src/services/offers/http_offers_service.dart';
import 'package:rgehenrypoitier/src/services/offers/offers_service.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<HttpService>(HttpService());
  getIt.registerSingleton<HttpBooksService>(HttpBooksService());
  getIt.registerSingleton<HttpOfferService>(HttpOfferService());
  getIt.registerSingleton<OfferService>(OfferService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BooksProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BookBestOfferProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const BooksListPage(),
        'cart': (BuildContext context) => const CartPage(),
      },
      title: 'RGE Book',
      theme: buildThemeData(),
    );
  }
}
