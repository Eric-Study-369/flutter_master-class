import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/component/my_back_buttom.dart';
import 'package:flutter_tutorial/component/my_list_tile.dart';
import 'package:flutter_tutorial/haper/haper_function.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            displayMessageToUser("Something went wrng", context);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text("No Data");
          }

          final users = snapshot.data!.docs;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 60.0,
                  left: 25,
                ),
                child: Row(
                  children: [
                    MyBackButtom(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, indext) {
                    final user = users[indext];
                    String username = user['username'];
                    String email = user['email'];
                    return MyListTile(
                      title: username,
                      subTitle: email,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
