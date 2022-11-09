// // ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names
//
// import 'dart:async';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqfilite_crud/Model/todo_model.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DbHelper {
//   static Database? _database;
//
//   Future<Database?> get db async {
//     if (_database != null) {
//       return _database!;
//     }
//
//     _database = await initDatabase();
//     return _database;
//   }
//
//   String TABLE_NAME = "todos.db";
//
//   Future<Database> initDatabase() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, TABLE_NAME);
//     return openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//
//   _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE todos
//     (
//     id INTEGER PRIMARY KEY,
//     student id TEXT,
//     name TEXT,
//     email TEXT,
//     department TEXT,
//     university TEXT,
//     datetime TEXT,
//
//     )
//
//     ''');
//   }
//
//   Future addTodo(TodoModel todoModel) async {
//     Database? database = await db;
//     return await database!.insert('todos', todoModel.toJson());
//   }
//
//   Future<List<TodoModel>?> getTodoModel() async {
//     Database? database = await db;
//     var data = await database!.query("todos", orderBy: "id");
//
//     List<TodoModel> todoModels =
//         data.map((todoModel) => TodoModel.fromJson(todoModel)).toList();
//
//     return todoModels;
//   }
//
//   updateTodo(TodoModel todoModel) async {
//     Database? database = await db;
//     return database!.update("todos", todoModel.toJson(),
//         where: 'id = ?', whereArgs: [todoModel.id]);
//   }
//
//   delete(int id) async {
//     Database? database = await db;
//     return database!.delete("todos", where: 'id = ?', whereArgs: [id]);
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqfilite_crud/Model/todo_model.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper {
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database;
  }

  String TABLE_NAME = "todos.db";

  Future<Database> initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, TABLE_NAME);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todos 
    (  
    id INTEGER PRIMARY KEY,
    student_id TEXT,
    name TEXT,
    email TEXT,
    department TEXT,
    university TEXT,
    datetime TEXT
    )
   
    ''');
  }

  Future addTodo(TodoModel todoModel) async {
    Database? database = await db;
    return await database!.insert('todos', todoModel.toJson());
  }

  Future<List<TodoModel>?> getTodoModel() async {
    Database? database = await db;
    var data = await database!.query("todos", orderBy: "id");

    List<TodoModel> todoModels =
    data.map((todoModel) => TodoModel.fromJson(todoModel)).toList();

    return todoModels;
  }


  updateTodo(TodoModel todoModel)async{
    Database? database = await db;
    return database!.update("todos",todoModel.toJson(),where: 'id = ?',whereArgs: [todoModel.id]);


  }


  delete(int id)async{
    Database? database = await db;
    return database!.delete("todos",where: 'id = ?',whereArgs: [id] );







  }

// deleteTodo(int id) async {
//   Database? database = await db;
//   database!.delete("todos", where: 'id = ?', whereArgs: [id]);
// }
//
// updateTodo(TodoModel todoModel) async {
//   Database? database = await db;
//   database!.update("todos", todoModel.toJson(),
//       where: 'id = ?', whereArgs: [todoModel.id]);
// }
}




