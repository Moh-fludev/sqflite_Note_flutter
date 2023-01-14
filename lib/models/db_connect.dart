

import 'package:app03/models/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databaseconnect {
  Database? _database;
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const db_name = 'todo.db';

    final path = join(dbpath, db_name);
    _database = await openDatabase(path, version: 1, onCreate: _oncreate);
    return _database!;
  }

  Future<void> _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE todo( 
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title  TEXT,
    creationdate TEXT,
    ischecked INTEGER
    )
''');
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;
    await db.insert(
      'todo',
      todo.tomap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletetodo(Todo todo) async {
    final db = await database;
    await db.delete('todo', where: 'id==?', whereArgs: [todo.id]);
  }

  Future<List<Todo>> gettodo() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('todo', orderBy: 'id desc');
    return List.generate(
      items.length,
      (index) => Todo(
        id: items[index]['id'],
          title: items[index]['title'],
          creationdate: DateTime.parse(items[index]['creationdate']),
          ischecked:  items[index]['ischecked']==1? true:false ),
    );
  }
}
