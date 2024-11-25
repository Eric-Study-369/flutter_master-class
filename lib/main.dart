import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 241, 245),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              color: Colors.deepPurple[500],
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepPurple[400],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepPurple[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
