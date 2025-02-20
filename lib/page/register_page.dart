import 'package:flutter/material.dart';
import 'package:flutter_tutorial/component/buttom.dart';
import 'package:flutter_tutorial/component/my_textfile.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  Register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 20),
              const Text(
                "M I N I M A l",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 50),
              MytextField(
                hinText: "UserName",
                obsureText: false,
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              MytextField(
                hinText: "Email",
                obsureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              MytextField(
                hinText: "Password",
                obsureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              MytextField(
                hinText: "Confirm Password",
                obsureText: true,
                controller: confirmpasswordController,
              ),
              const SizedBox(height: 25),
              MyButtom(
                text: "Register",
                onTap: Register,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      " login here",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
