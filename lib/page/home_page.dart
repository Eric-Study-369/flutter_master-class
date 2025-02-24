import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/component/my_drawer.dart';
import 'package:flutter_tutorial/component/my_list_tile.dart';
import 'package:flutter_tutorial/component/my_post_buttom.dart';
import 'package:flutter_tutorial/component/my_textfile.dart';
import 'package:flutter_tutorial/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // acess Firestore
  final FirestoreDatabase database = FirestoreDatabase();
  // text controller
  final TextEditingController newpostController = TextEditingController();

  void postMessage() {
    if (newpostController.text.isNotEmpty) {
      String message = newpostController.text;
      database.addPost(message);
    }

    newpostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MytextField(
                    hinText: "Say something...",
                    obsureText: false,
                    controller: newpostController,
                  ),
                ),
                PostButton(
                  onTap: postMessage,
                )
              ],
            ),
          ),
          StreamBuilder(
            stream: database.getPostStream(),
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // get all post
              final posts = snapshort.data!.docs;

              if (snapshort.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No Post.. Post Somthing!"),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, Index) {
                    final post = posts[Index];

                    // get data frome each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    return MyListTile(title: message, subTitle: userEmail);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
