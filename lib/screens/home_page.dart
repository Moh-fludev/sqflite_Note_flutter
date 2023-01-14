import 'package:app03/models/db_connect.dart';
import 'package:app03/models/todo_model.dart';
import 'package:app03/widgets/todolist.dart';
import 'package:app03/widgets/userinput.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var db = Databaseconnect();
  void additem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteitem(Todo todo) async {
    await db.deletetodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 148, 205),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 121, 205),
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        TodoList(
          insertitem: additem,
          deleteitem: deleteitem,
        ),
        UserInput(insertfun: additem),
      ]),
    );
  }
}
