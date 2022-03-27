import 'dart:convert';

import 'package:rgehenrypoitier/main.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';
import 'package:rgehenrypoitier/src/services/http_service.dart';
import 'package:http/http.dart' as http;

class HttpBookService {
  String pathToBooks = "https://henri-potier.techx.fr/books";
  Future<List<Book>> getBooks() async {
    List<Book> books = [];
    HttpService httpService = getIt<HttpService>();
    http.Response? response = await httpService.get(pathToBooks);

    if (response != null) {
      var fromApi = jsonDecode(response.body);
      books = List<Book>.from(fromApi.map((bk) => Book.fromMap(bk)));
      print(books);
      //books = result.map<Book>((e) => Book.fromMap(e));

    }
    return books;
  }
}
