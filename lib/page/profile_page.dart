import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/component/my_back_buttom.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // show current login user
  final User? currentUser = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetail() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: currentUser == null
          ? const Center(child: Text("No user logged in"))
          : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: getUserDetail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  Map<String, dynamic>? user = snapshot.data!.data();
                  return Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 80.0,
                            left: 25,
                          ),
                          child: Row(
                            children: [
                              MyBackButtom(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: const Icon(
                            Icons.person,
                            size: 64,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          user?['username'] ?? "No Username",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          user?['email'] ?? "No Email",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text("No Data");
                }
              },
            ),
    );
  }
}
