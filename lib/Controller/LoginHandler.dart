import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final ValueNotifier<bool> loginState = ValueNotifier<bool>(false);

Future<void> handleLogin(
    BuildContext context, String username, String password) async {
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

    loginState.value = true;
    // Navigate to homepage
    context.go('/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login Failed: ${message ?? 'Unknown error'}')),
    );
  }
}
