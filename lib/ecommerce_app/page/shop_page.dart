import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommerce_app/components/my_drawer.dart';
import 'package:flutter_tutorial/ecommerce_app/components/my_product.dart';
import 'package:flutter_tutorial/ecommerce_app/models/shop.dart';
//import 'package:flutter_tutorial/ecommerce_app/models/product.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop page'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/card_page'),
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 35),
          //shoop title
          Center(
            child: Text(
              "Pick from a selected list of prime products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16),
            ),
          ),

          //shop subtitle

          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each individual product
                final product = products[index];

                //return as a product tile UI
                return MyProductTire(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
