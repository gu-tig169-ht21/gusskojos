// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoItem> todoList = [];

  //Get todoList
  List<TodoItem> get list => todoList;

  //Add ItemObjekt to items list
  void addItem(TodoItem item) {
    todoList.add(item);
    notifyListeners();
  }

  //Delete ItemObjekt from items list
  void deleteItem(TodoItem item) {
    todoList.remove(item);
    notifyListeners();
  }

  //Change ItemObjekt to opposite value of current value
  void isCompleted(TodoItem item) {
    item.toggleCompleted(item);
    notifyListeners();
  }
}
