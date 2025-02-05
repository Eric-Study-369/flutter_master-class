// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final user = FirebaseAuth.instance.currentUser!;

//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
//       ),
//       body: Center(
//           child: Text(
//         "Login page: " + user.email!,
//         style: TextStyle(fontSize: 20),
//       )),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/page/auth_page.dart';
import 'package:flutter_tutorial/services/auth_services.dart'; // Import AuthServices

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  void signUserOut(BuildContext context) async {
    await AuthServices().signOutGoogle(); // Sign out from Google & Firebase
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => AuthPage()), // Redirect to AuthPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          user != null
              ? "Welcome: ${user!.email ?? 'Unknown Email'}"
              : "No user signed in",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
