import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoItem> todoList = [];
  int _filterBy = 3;

  //Get todoList
  List<TodoItem> get list => todoList;

  //Get filter Value
  int get filterBy => _filterBy;

  //Set filterBy
  void setFilterby(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  //Function to filter list
  List<TodoItem> filterList(list, value) {
    if (value == 2) {
      return todoList.where((item) => item.isCompleted == true).toList();
    } else if (value == 3) {
      return todoList.where((item) => item.isCompleted == false).toList();
    }
    return todoList;
  }

  //Add ItemObjekt to list
  void addItem(TodoItem item) {
    todoList.add(item);
    notifyListeners();
  }

  //Delete ItemObjekt from list
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
