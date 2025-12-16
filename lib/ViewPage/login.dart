import 'package:business/Controller/LoginHandler.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // child: Text('Login Page')
      child: Column(
        children: [
          const Text("Login", style: TextStyle(fontSize: 24)),
          CustomTextField(
              labelText: "Username", controller: usernameController),
          CustomTextField(
              labelText: "Password",
              controller: passwordController,
              obscureText: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {
              // Handle login action
              // showAlertDialog(context, "Login", "Login button pressed")
              handleLogin(
                  context, usernameController.text, passwordController.text)
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 56,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
