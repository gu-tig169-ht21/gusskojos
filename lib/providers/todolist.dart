import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoListProvider with ChangeNotifier {
  TodoListProvider() {
    fetchTodoOnStartup();
  }

  //Denna fungerar
  void fetchTodoOnStartup() async {
    todoList = await TodoService.fetchTodos();
    notifyListeners();
  }

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
      return todoList.where((item) => item.done == true).toList();
    } else if (value == 3) {
      return todoList.where((item) => item.done == false).toList();
    }
    return todoList;
  }

  //Add ItemObjekt to list
  void addItem(TodoItem item) async {
    TodoService.postTodo(item);
    todoList.add(item);
    notifyListeners();
  }

  //Delete ItemObjekt from list
  void deleteItem(TodoItem item) {
    TodoService.deleteTodoItem(item);
    todoList.remove(item);
    notifyListeners();
  }

  //Change ItemObjekt to opposite value of current value
  void isCompleted(TodoItem item) {
    item.done = !item.done;
    TodoService.updateTodo(item);
    //item.toggleCompleted(item);
    notifyListeners();
  }
}
