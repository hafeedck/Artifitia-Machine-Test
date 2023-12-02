import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    String path = join(await getDatabasesPath(), 'my_route.db');
    _database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
    CREATE TABLE quiz (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      correctanswer TEXT NOT NULL,
      wronganswer TEXT NOT NULL
    )
  ''');
    });

    return _database!;
  }

  // Insert data into the insertQuizData table
  Future<void> insertQuizData(
    String correctanswer,
    String wronganswer,
  ) async {
    final db = await database;

    await db.insert('quiz', {
      'correctanswer': correctanswer,
      'wronganswer': wronganswer,
    });
  }

  Future<bool> tableExists(String table) async {
    final db = await database;
    final results =
        await db.query('sqlite_master', where: 'name = ?', whereArgs: [table]);
    return results.isNotEmpty;
  }

  static Future<List<Map<String, Object?>>?> getQuizData() async {
    final databaseHelper = DatabaseHelper();
    final tableExist = await databaseHelper.tableExists('quiz');

    if (!tableExist) {
      return null;
    }

    final db = await database;
    int? length;
    final results = await db.query('quiz', orderBy: 'id DESC', limit: length);

    if (results.isEmpty) {
      return null;
    }
    length = results.length;

    return results;
  }

  Future<List<Map<String, Object?>>?> fetQuizDta() async {
    final addedroutes = await DatabaseHelper.getQuizData();

    if (addedroutes != null) {
      return addedroutes;
    }
    return null;
  }

  Future<void> clearDatabase() async {
    final databasePath = await getDatabasesPath();

    await deleteDatabase('${databasePath}my_route.db');
  }

  Future<void> clearRoutes() async {
    final db = await DatabaseHelper.database;

    await db.delete('quiz');
  }
}
