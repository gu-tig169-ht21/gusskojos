import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/add_todo.dart';

//Main function to run App. Created for future routing
void main() => runApp(MaterialApp(
      title: 'TIG169 ToDo App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const Home(),
    ));
