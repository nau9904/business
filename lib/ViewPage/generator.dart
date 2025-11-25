import 'package:flutter/material.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  final List<String> _items = ['Aloe', 'Bonsai', 'Cactus', 'Fern', 'Palm'];
  int _index = 0;
  final Set<String> _favorites = {};

  String get current => _items[_index];

  void toggleFavorite() {
    setState(() {
      if (!_favorites.add(current)) {
        _favorites.remove(current);
      }
    });
  }

  void getNext() {
    setState(() {
      _index = (_index + 1) % _items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = _favorites.contains(current);
    final icon = isFavorite ? Icons.favorite : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: current),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: toggleFavorite,
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: getNext,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  final String pair;
  const BigCard({required this.pair, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
        child: Text(
          pair,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
