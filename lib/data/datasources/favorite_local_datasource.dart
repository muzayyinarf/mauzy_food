import 'dart:async';

import 'package:mauzy_food/data/models/restaurant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteLocalDatasource {
  static Database? _database;
  static const _tableName = 'favorites';

  static Future<Database> get database async {
    if (_database == null) {
      return _database = await initDatabase();
    }
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = join(
      await getDatabasesPath(),
      'app_database.db',
    );
    const sql = '''
          CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            idRestaurant TEXT UNIQUE,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )
        ''';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async => await db.execute(sql),
    );
  }

  // Create
  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db.insert(
      _tableName,
      restaurant.toMap(),
    );
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<List<Restaurant>> getAllFavorites() async {
    final db = await database;
    final result = await db.query(_tableName);
    return result.map((e) => Restaurant.fromMap(e)).toList();
  }

  Future<int> deleteFavorite(String id) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
