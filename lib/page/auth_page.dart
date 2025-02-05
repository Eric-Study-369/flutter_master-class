import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/page/home_apge.dart';
import 'package:flutter_tutorial/page/login_page.dart';
import 'package:flutter_tutorial/page/login_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user login
          if (snapshot.hasData) {
            return HomePage();
          }

          // user not login
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
