import 'package:flutter/material.dart';
import 'package:flutter_tutorial/services/auth/auth_services.dart';
import 'package:flutter_tutorial/componet/my_button.dart';
import 'package:flutter_tutorial/componet/mytext_field.dart';

class Registerpage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final void Function()? onTap;

  Registerpage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final _auth = AuthService();
    if (_passwordController.text == _confirmPassController.text) {
      try {
        _auth.sigUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password don't match!"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50),
          Text(
            "Let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
              hinText: "Email",
              obscureText: false,
              controller: _emailController),
          const SizedBox(height: 10),
          MyTextField(
            hinText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 10),
          MyTextField(
              hinText: "Confirm password",
              obscureText: true,
              controller: _confirmPassController),
          const SizedBox(height: 25),
          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
