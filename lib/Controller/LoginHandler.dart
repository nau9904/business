import 'package:flutter/material.dart';

Future<void> handleLogin(
    BuildContext context, String username, String password) async {
  // Simulate a login process
  // await Future.delayed(const Duration(seconds: 2));

  // For demonstration, consider login successful if username and password are not empty
  if (username.isNotEmpty && password.isNotEmpty) {
    if (username == 'admin' && password == 'admin') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Login Failed: Wrong username or password')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Login Failed: Please enter valid credentials')),
    );
  }
}
