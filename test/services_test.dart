import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgehenrypoitier/src/app/providers/books_provider.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_cart_price.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';
import 'package:rgehenrypoitier/src/domain/entities/offer_type_enum.dart';
import 'package:rgehenrypoitier/src/domain/entities/offers.dart';
import 'package:rgehenrypoitier/src/services/offers/offers_service.dart';

main() {
  test("Test OfferService", () async {
    double amount = 100;
    List<Offer> offers = [];
    offers.add(
        PercentCommercialOffer.fromMap({"type": "percentage", "value": 5}));
    offers.add(MinusCommercialOffer.fromMap({"type": "minus", "value": 99}));
    offers.add(SliceCommercialOffer.fromMap(
        {"type": "slice", "value": 80, "sliceValue": 100}));
    OfferService service = OfferService();
    Offer result = service.findBestOffer(offers, amount);
    expect(result.type, OfferType.minus);
  });

  test("Test OfferService expected percent", () async {
    double amount = 100;
    List<Offer> offers = [];
    offers.add(
        PercentCommercialOffer.fromMap({"type": "percentage", "value": 99}));
    offers.add(MinusCommercialOffer.fromMap({"type": "minus", "value": 1}));
    offers.add(SliceCommercialOffer.fromMap(
        {"type": "slice", "value": 8, "sliceValue": 100}));
    OfferService service = OfferService();
    Offer result = service.findBestOffer(offers, amount);
    expect(result.type, OfferType.percent);
  });

  test("Test add book to cart", () async {
    Book bk = Book.fromMap({
      'isbn': "c8fabf68-8374-48fe-a7ea-a00ccd07afff",
      'title': "Henri Potier à l'école des sorciers",
      'price': 35,
      'cover':
          "'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media'",
      'synopsis': ["A", "L.", "H."]
    });

    BooksProvider provider = BooksProvider();
    expect(provider.booksLoaded, false);

    provider.addBookToCart(bk);
    expect(provider.selected.length, 1);

    provider.removeBookFromCart(bk);
    expect(provider.selected.length, 0);

    provider.addBookToCart(bk);
    expect(provider.selected.length, 1);
    provider.emptyCart();
    expect(provider.selected.length, 0);
  });
}
