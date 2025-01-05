import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommer_app/componenets/cart_item.dart';
import 'package:flutter_tutorial/ecommer_app/models/shoe.dart';
import 'package:provider/provider.dart';
import '../models/card.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCard().length,
                itemBuilder: (context, index) {
                  //get indiveidual shoe
                  Shoe indivedualShoe = value.getUserCard()[index];

                  // return the card item
                  return CardItem(
                    shoe: indivedualShoe,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
