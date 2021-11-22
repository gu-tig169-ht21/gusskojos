import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoListProvider with ChangeNotifier {
  TodoListProvider() {
    fetchTodo();
  }

  List<TodoItem> todoList = [];
  int _filterBy = 3;

  //Get todoList
  List<TodoItem> get list => todoList;

  //Get filter Value
  int get filterBy => _filterBy;

  Future<List<TodoItem>> fetchTodo() async {
    todoList.clear();
    var result = await TodoService.fetchTodos();
    todoList = result;
    print(result[0].done);
    notifyListeners();
    return todoList;
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

  //Get todoList
  void getTodo(list) {
    for (var item in list) {
      todoList.add(item);
    }
    notifyListeners();
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
  void deleteItem(TodoItem item) {
    TodoService.deleteTodoItem(item);
    todoList.remove(item);
    notifyListeners();
  }

  //Change ItemObjekt to opposite value of current value
  void isCompleted(TodoItem item) async {
    item.done = !item.done;
    var result = await TodoService.updateTodo(item);
    //getTodo(result);
    notifyListeners();
  }
}
