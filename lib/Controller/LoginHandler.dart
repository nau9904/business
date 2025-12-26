import 'package:flutter/material.dart';

Future<void> handleLogin(
    BuildContext context, String username, String password) async {
  // Simulate a login process
  // await Future.delayed(const Duration(seconds: 2));

  // For demonstration, consider login successful if username and password are not empty
  if (username.isNotEmpty && password.isNotEmpty) {
    if (username == 'admin' && password == 'admin') {
      isLoginSuccessful(context, true);
    } else {
      isLoginSuccessful(context, false, 'Invalid username or password');
    }
  } else {
    isLoginSuccessful(context, false, 'Username and password cannot be empty');
  }
}

void isLoginSuccessful(BuildContext context, bool success, [String? message]) {
  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Successful')),
    );
    // Navigate to homepage
    print("Navigating to homepage...");
    Navigator.pushReplacementNamed(context, '/homepage');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login Failed: ${message ?? 'Unknown error'}')),
    );
  }
}
