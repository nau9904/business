import 'package:business/ViewPage/about.dart';
import 'package:business/ViewPage/contact.dart';
import 'package:business/ViewPage/favorite.dart';
import 'package:flutter/material.dart';

import 'ViewPage/generator.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// Add this import

void main() {
  // Initialize the database factory before using any database operations
  // databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHẬU CẢNH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = Favorite();
        break;
      case 2:
        page = About();
        break;
      case 3:
        page = Contact();
      default:
        page = Center(child: Text('PAGE NOT FOUND 404'));
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('About'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.email),
                  label: Text('Contact'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                // print('selected: $value');
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

// ...
