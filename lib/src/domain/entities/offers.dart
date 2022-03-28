import 'package:rgehenrypoitier/src/domain/entities/offer_type_enum.dart';

abstract class CommercialOffer {
  double initialPrice = 0;
  double discountPrice = 0;
  double reduction = 0;
  OfferType get type;
  double getPrice(double initialValue);
  @override
  String toString() {
    return "${type == OfferType.minus ? 'REDUCTION' : (type == OfferType.percent ? 'POURCENTAGE' : 'PAR PLAGE')} Prix initial: $initialPrice. Le prix à payer est $discountPrice. Vous gagnez ${initialPrice - discountPrice}";
  }
}

abstract class Offer extends CommercialOffer {
  num value;

  Offer.fromMap(Map<String, dynamic> data) : value = data['value'];
}

class PercentCommercialOffer extends Offer {
  PercentCommercialOffer.fromMap(Map<String, dynamic> data)
      : super.fromMap(data);

  @override
  double getPrice(double initialValue) {
    initialPrice = initialValue;
    discountPrice = initialValue - (initialValue * value / 100);
    return discountPrice;
  }

  @override
  OfferType get type => OfferType.percent;
}

class MinusCommercialOffer extends Offer {
  MinusCommercialOffer.fromMap(Map<String, dynamic> data) : super.fromMap(data);

  @override
  double getPrice(double initialValue) {
    initialPrice = initialValue;
    discountPrice = initialValue - value;
    return discountPrice;
  }

  @override
  OfferType get type => OfferType.minus;
}

class SliceCommercialOffer extends Offer {
  late int sliceValue;
  SliceCommercialOffer.fromMap(
    Map<String, dynamic> data,
  ) : super.fromMap(data) {
    sliceValue = data["sliceValue"];
  }

  @override
  double getPrice(double initialValue) {
    initialPrice = initialValue;
    double sliceCount = (initialValue / sliceValue);
    discountPrice = initialValue - (value * sliceCount);
    return discountPrice;
  }

  @override
  OfferType get type => OfferType.slice;
}
