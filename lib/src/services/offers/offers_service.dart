import 'package:rgehenrypoitier/src/domain/entities/offers.dart';

class OfferService {
  Offer findBestOffer(List<Offer> offers, double initialCartTotal) {
    List<Offer> workList = offers;
    workList.sort((a, b) =>
        a.getPrice(initialCartTotal).compareTo(b.getPrice(initialCartTotal)));
    Offer result = workList.first;
    return result;
  }
}
