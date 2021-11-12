import 'package:flutter/material.dart';
import 'package:todo_app/models/item.dart';

class TodoItem with ChangeNotifier {
  List<Item> items = [];

  //Add ItemObjekt to items list
  void addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  //Delete ItemObjekt from items list
  void deleteItem(Item item) {
    items.remove(item);
  }
}
