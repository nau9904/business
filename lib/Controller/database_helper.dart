import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/User.dart';

Future<User?> loadUserById(int userId) async {
  // Simulate a delay for loading user information
  await Future.delayed(Duration(seconds: 2));
  // Here you would typically load user info from a database or API
  final String response = await rootBundle.loadString('assets/dummyData.json');
  final data = await json.decode(response);

  List usersJson = data['users'];
  List<User> users = usersJson.map((user) => User.fromJson(user)).toList();

  //Find user with id userId
  return users.firstWhere(
    (user) => user.id == userId,
    // orElse: () => null,
  );
}
