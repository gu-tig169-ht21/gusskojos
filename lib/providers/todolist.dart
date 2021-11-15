// ignore: file_names
import 'package:flutter/material.dart';
import 'package:todo_app/models/itemcard.dart';

class TodoListProvider with ChangeNotifier {
  List<ItemCard> todoList = [];

  //Get todoList
  List<ItemCard> get list => todoList;

  //Add ItemObjekt to items list
  void addItem(ItemCard item) {
    todoList.add(item);
    notifyListeners();
  }

  //Delete ItemObjekt from items list
  void deleteItem(ItemCard item) {
    todoList.remove(item);
    notifyListeners();
  }

  //Change ItemObjekt to opposite value of current value
  void isCompleted(ItemCard item) {
    item.toggleCompleted(item);
    notifyListeners();
  }
}
