import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/add_todo.dart';

//Main function to run App. Created for future routing
void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add': (context) => AddTodo(),
      },
      theme: ThemeData(primarySwatch: Colors.orange),
    ));
