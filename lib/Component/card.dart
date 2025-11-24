import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String title;
  const ImageCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            // onPressed
          },
          child: Center(
            child: Text(
              this.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ));
  }
}
