import 'package:app03/screens/home_page.dart';
import 'package:flutter/material.dart';
// import 'models/db_connect.dart';
// import 'models/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final db = Databaseconnect();
  // await db.insertTodo(Todo(
  //     id: 1, title: 'Title1', creationdate: DateTime.now(), ischecked: false));
  // print(await db.gettodo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
    );
  }
}
