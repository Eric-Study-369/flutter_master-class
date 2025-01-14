import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommerce_app/models/product.dart';
import 'package:flutter_tutorial/ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTire extends StatelessWidget {
  final Product product;
  const MyProductTire({super.key, required this.product});

  //fun add item to a card
  void addToCard(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Do you want to add item to the card"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to card
                    context.read<Shop>().addToCard(product);
                  },
                  child: Text("Add"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25.0),
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(height: 25),
              //product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              //product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          // product price + add to card button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text('\$' + product.price.toStringAsFixed(3)),

              //add to card buttom
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCard(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
