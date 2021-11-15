import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/add_todo.dart';
import 'package:todo_app/providers/todolist.dart';
import 'package:provider/provider.dart';

//Main function to run App. Created for future routing
void main() {
  var state = TodoListProvider();
  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add': (context) => AddTodo(),
      },
      theme: ThemeData(primarySwatch: Colors.orange),
    ),
  ));
}
