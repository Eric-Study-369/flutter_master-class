import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommer_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        prices: '256',
        description: 'The forward-thinking desing of his lates signature shoe',
        imagePath: 'lib/img/nike2.png'),
    Shoe(
        name: 'KD Terys',
        prices: '270',
        description: 'You\'ll be rady to play in the KD Trey 5 VIII',
        imagePath: 'lib/img/nike3.png'),
    Shoe(
        name: 'Air Jordan',
        prices: '260',
        description: 'A secure, stable fit with an extra-duable cushioning',
        imagePath: 'lib/img/nike1.png'),
    Shoe(
        name: 'Kyrie 6',
        prices: '190',
        description: 'Bouncy cushinoning and smooth pivots',
        imagePath: 'lib/img/nike4.png'),
  ];
  // list of item in user card
  List<Shoe> userCard = [];

  //get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get card
  List<Shoe> getUserCard() {
    return userCard;
  }

  // add item to card
  void addItemToCard(Shoe shoe) {
    userCard.add(shoe);
    notifyListeners();
  }

  // remove item form card
  void removeItemFromCard(Shoe shoe) {
    userCard.remove(shoe);
    notifyListeners();
  }
}
