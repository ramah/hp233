import 'package:rgehenrypoitier/src/domain/entities/offer_type_enum.dart';
import 'package:rgehenrypoitier/src/domain/entities/offers.dart';

class OfferWrapper {
  OfferType? fromString(String input) {
    if (input == "percentage") {
      return OfferType.percent;
    }
    if (input == "minus") {
      return OfferType.minus;
    }
    if (input == "slice") {
      return OfferType.slice;
    }
    return null;
  }

  List<Offer> offers = [];
  OfferWrapper.fromMap(Map<String, dynamic> rawData) {
    List<dynamic> _offers = rawData['offers'] as List<dynamic>;

    for (var _off in _offers) {
      OfferType? _type = fromString(_off["type"]);
      late Offer _offer;
      if (_type == OfferType.slice) {
        _offer = SliceCommercialOffer.fromMap(
          _off,
        );
      } else {
        _offer = _type == OfferType.minus
            ? MinusCommercialOffer.fromMap(_off)
            : PercentCommercialOffer.fromMap(_off);
      }
      offers.add(_offer);
    }
  }
}
