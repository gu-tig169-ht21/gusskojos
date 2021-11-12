import 'package:flutter/material.dart';

class Item {
  String title;
  bool isCompleted;

  Item({required this.title, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
