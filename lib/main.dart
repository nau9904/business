import 'package:business/ViewPage/home.dart';
import 'package:business/ViewPage/product.dart';
import 'package:business/ViewPage/profile.dart';
import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Doanh nghiệp Chậu Cảnh'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("Add button pressed!" + _counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Trang chủ'),
                Tab(icon: Icon(Icons.store), text: 'Sản phẩm'),
                Tab(icon: Icon(Icons.add_box), text: 'Nhập kho'),
                Tab(icon: Icon(Icons.person), text: 'Thông tin'),
              ],
            ),
          ),
          body: TabBarView(children: [Home(), Product(10), Profile()])),
    );
  }
}
