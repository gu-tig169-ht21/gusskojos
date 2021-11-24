import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoListProvider with ChangeNotifier {
  TodoListProvider() {
    fetchTodo();
  }

  List<TodoItem> todoList = [];
  int _filterBy = 3;
  bool errorState = false;

  //Get todoList
  List<TodoItem> get list => todoList;

  //Get filter Value
  int get filterBy => _filterBy;

  void fetchTodo() async {
    var result = await TodoService.fetchTodos();
    if (result != null) {
      errorState = false;
      todoList = result;
      notifyListeners();
    } else {
      errorState = true;
    }
  }

  //Set filterBy
  void setFilterby(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  //Function to filter list
  List<TodoItem> filterList(list, value) {
    if (value == 2) {
      return todoList.where((item) => item.done == true).toList();
    } else if (value == 3) {
      return todoList.where((item) => item.done == false).toList();
    }
    return todoList;
  }

  //Add ItemObjekt to list
  void addItem(TodoItem item) async {
    var result = await TodoService.postTodo(item);
    //todoList.add(item);
    todoList.clear();
    todoList = result;
    notifyListeners();
  }

  //Delete ItemObjekt from list
  void deleteItem(TodoItem item) async {
    todoList = await TodoService.deleteTodoItem(item);
    notifyListeners();
  }

  //Change ItemObjekt to opposite value of current value
  void isCompleted(TodoItem item) async {
    item.done = !item.done;
    todoList = await TodoService.updateTodo(item);
    notifyListeners();
  }
}
