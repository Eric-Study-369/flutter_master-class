import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ecommerce_app/models/shop.dart';
import 'package:flutter_tutorial/ecommerce_app/page/card_page.dart';
import 'package:flutter_tutorial/ecommerce_app/page/intro_page.dart';
import 'package:flutter_tutorial/ecommerce_app/page/shop_page.dart';
import 'package:flutter_tutorial/ecommerce_app/thmes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intropage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const Intropage(),
        '/shop_page': (context) => const ShopPage(),
        '/card_page': (context) => const CardPage(),
      },
    );
  }
}
