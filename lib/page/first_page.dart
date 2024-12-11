// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1st page")),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 48,
              ),
            ),

            //home page list title
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/homepage');
              },
            ),

            //setting page
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S e t t i n g"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/settingpage');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go To Second page"),
          onPressed: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, '/secondpage');
          },
        ),
      ),
    );
  }
}
