import 'package:business/Controller/database_helper.dart';
import 'package:business/model/User.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
        future: loadUserById(1),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${user.name}",
                    style: const TextStyle(fontSize: 18)),
                Text("Phone: ${user.phone}",
                    style: const TextStyle(fontSize: 18)),
                Text("Address: ${user.address}",
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        });
  }
}
