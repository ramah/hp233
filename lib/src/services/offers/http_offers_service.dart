import 'dart:convert';

import 'package:rgehenrypoitier/main.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';
import 'package:rgehenrypoitier/src/domain/entities/offers.dart';
import 'package:rgehenrypoitier/src/domain/entities/offers_wrapper.dart';
import 'package:rgehenrypoitier/src/services/http_service.dart';
import 'package:http/http.dart' as http;

class HttpOfferService {
  Future<List<Offer>> getOffers(List<Book> selected) async {
    String isbnChain = selected.map((e) => e.isbn).toList().join(',');

    List<Offer> offers = [];
    String offerPath =
        "https://henri-potier.techx.fr/books/${isbnChain}/commercialOffers";
    HttpService httpService = getIt<HttpService>();
    http.Response? response = await httpService.get(offerPath);

    if (response != null) {
      var fromApi = jsonDecode(response.body);
      OfferWrapper wrapper = OfferWrapper.fromMap(fromApi);
      offers = wrapper.offers as List<Offer>;
    }
    return offers;
  }
}
