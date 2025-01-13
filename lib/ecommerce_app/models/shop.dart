import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  // prodiuct foe sals
  final List<Product> _shop = [
    Product(
        name: 'product 1',
        price: 9.99,
        description:
            'Item decription to description to decription the product more onfo here will look like this',
        imagePath: 'lib/img/nike1.png'),
    Product(
        name: 'product 2',
        price: 9.99,
        description:
            'Item decription to description to decription the product more onfo here will look like this',
        imagePath: 'lib/img/nike2.png'),
    Product(
        name: 'product 3',
        price: 9.99,
        description:
            'Item decription to description to decription the product more onfo here will look like this',
        imagePath: 'lib/img/nike3.png'),
    Product(
        name: 'product 4',
        price: 9.99,
        description: 'Item decription',
        imagePath: 'lib/img/nike4.png'),
  ];

  // user card
  List<Product> _card = [];

  //get product list
  List<Product> get shop => _shop;

  // get user card
  List<Product> get card => _card;

  // add itemn to card
  void addToCard(Product item) {
    _card.add(item);
    notifyListeners();
  }

  // remove item from card
  void removeFromCard(Product item) {
    _card.remove(item);
    notifyListeners();
  }
}
