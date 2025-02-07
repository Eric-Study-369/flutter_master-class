import 'package:flutter/material.dart';
import 'package:flutter_tutorial/auth/login_register.dart';
import 'package:flutter_tutorial/theme/light_mode.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}
