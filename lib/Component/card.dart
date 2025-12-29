import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  ProductCard(
      {super.key,
      required this.title,
      this.price = "\$0.00",
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.shopping_bag, size: 100, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: const [
                    StarIcon(),
                    StarIcon(),
                    StarIcon(),
                    StarIcon(),
                    StarIcon(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  const StarIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.star, color: Colors.amber, size: 15);
  }
}
