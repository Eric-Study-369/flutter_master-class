import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommer_app/models/card.dart';
import 'package:flutter_tutorial/ecommer_app/page/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
        home: IntroPage(),
      ),
    );
  }
}
