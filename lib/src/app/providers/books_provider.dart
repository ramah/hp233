import 'package:flutter/foundation.dart';
import 'package:rgehenrypoitier/main.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';
import 'package:rgehenrypoitier/src/services/books/http_books_service.dart';

class BooksProvider with ChangeNotifier {
  List<Book> books = [];
  List<Book> selected = [];
  List<Book> searchResult = [];

  bool booksLoaded = false;
  bool isSearching = false;

  Future<void> getBooks() async {
    books = await getIt<HttpBooksService>().getBooks();
    booksLoaded = true;
    notifyListeners();
  }

  void addBookToCart(Book book) async {
    if (!selected.contains(book)) {
      selected.add(book);
    }

    notifyListeners();
  }

  void removeBookFromCart(Book book) {
    if (selected.contains(book)) {
      selected.remove(book);
    }
    notifyListeners();
  }

  void emptyCart() {
    selected = [];
    
    notifyListeners();
  }

  void search(String input) {
    if (input.isNotEmpty) {
      isSearching = true;
      List<String> substrings = input.split(" ");
      searchResult = books
          .where((book) => substrings.every((subs) =>
              book.title.contains(subs) || book.synopsis.join().contains(subs)))
          .toList();
    } else {
      isSearching = false;
    }
    notifyListeners();
  }
}
