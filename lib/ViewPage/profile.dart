import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text('Địa chỉ: '),
          SizedBox(height: 30),
          Text('Số điện thoại: '),
        ],
      ),
    );
  }
}
