import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // text use editing controller what the user ttping
  TextEditingController myController = TextEditingController();

  String greetMessage = " ";

  void greeUser() {
    setState(() {
      greetMessage = "Hello," + myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetMessage),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Type your name.."),
              ),
              ElevatedButton(onPressed: greeUser, child: Text("tap")),
            ],
          ),
        ),
      ),
    );
  }
}
