// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;
//
//   DatabaseHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('items.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String fileName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, fileName);
//
//     print("Database path: $path");
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }
//
//   Future<void> _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE items (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         quantity TEXT NOT NULL
//       )
//     ''');
//   }
//
//   Future<int> insertItem(Map<String, dynamic> item) async {
//     final db = await database;
//     return await db.insert('items', item);
//   }
//
//   Future<List<Map<String, dynamic>>> getAllItems() async {
//     final db = await database;
//     return await db.query('items');
//   }
//
//   Future<int> deleteAllItems() async {
//     final db = await database;
//     return await db.delete('items');
//   }
// }
