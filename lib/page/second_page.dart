import 'package:flutter/material.dart';

class Secondtpage extends StatelessWidget {
  const Secondtpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
