import 'package:flutter/material.dart';
import 'package:rgehenrypoitier/main.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';
import 'package:rgehenrypoitier/src/domain/entities/offers.dart';
import 'package:rgehenrypoitier/src/services/offers/http_offers_service.dart';
import 'package:rgehenrypoitier/src/services/offers/offers_service.dart';

class BookBestOfferProvider extends ChangeNotifier {
  List<Book> _selectedBooks = [];
  List<Book> get selectedBooks => _selectedBooks;
  bool loadingOffer = true;
  Offer? bestSelectedOffer;
  double cartTotal = 0;
  double cartDiscount = 0;
  double cartFinalTotal = 0;
  void populateBooks(List<Book> books) async {
    _selectedBooks = books;
    double totalCost = books.fold(
        0, (previousValue, element) => previousValue + element.price);

    var offers = await getIt<HttpOfferService>().getOffers(books);
    var bestOffer = getIt<OfferService>().findBestOffer(offers, totalCost);

    loadingOffer = false;
    bestSelectedOffer = bestOffer;

    cartTotal = totalCost;
    cartFinalTotal = bestOffer.getPrice(totalCost);

    cartDiscount = totalCost-cartFinalTotal;
    notifyListeners();
  }

  void reset() {
    _selectedBooks = [];
    loadingOffer = false;
    notifyListeners();
  }

  void startLoadingOffer() {
    loadingOffer = true;
    notifyListeners();
  }

  void stopLoadingOffer() {
    loadingOffer = false;
    notifyListeners();
  }
}
