import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommer_app/componenets/shoe_tile.dart';
import 'package:flutter_tutorial/ecommer_app/models/card.dart';
import 'package:flutter_tutorial/ecommer_app/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to card
  void addShoeToCard(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCard(shoe);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added !'),
              content: Text('Check your card to see the item'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyon flies.. some fly loger than other',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          //hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //create shoe
                  Shoe shoe = value.getShoeList()[index];
                  // return shoe
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCard(shoe),
                  );
                }),
          ),

          const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
