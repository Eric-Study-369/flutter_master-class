import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterpageState();
}

class _CounterpageState extends State<CounterPage> {
  int _conter = 0;

  void _incrementCounter() {
    setState(() {
      _conter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you can pushed the button of many time"),
            Text(
              _conter.toString(),
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: _incrementCounter, child: Text("Enter Your botton")),
          ],
        ),
      ),
    );
  }
}
