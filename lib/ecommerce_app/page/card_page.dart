import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommerce_app/components/my_button.dart';
import 'package:flutter_tutorial/ecommerce_app/models/product.dart';
import 'package:flutter_tutorial/ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  //remove acess item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("remove this item from your cart"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to card
                    context.read<Shop>().removeFromCard(product);
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User want to pay! Connect this app to your payment back!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = context.watch<Shop>().card;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Card Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: card.length,
                  itemBuilder: (context, index) {
                    final item = card[index];

                    //return as a card title UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("Pay Now"),
            ),
          ),
        ],
      ),
    );
  }
}
