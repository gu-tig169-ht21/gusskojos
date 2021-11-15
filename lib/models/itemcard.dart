import 'package:flutter/material.dart';

class ItemCard {
  String title;
  bool isCompleted;

  ItemCard({required this.title, this.isCompleted = false});

  void toggleCompleted(item) {
    isCompleted = !isCompleted;
  }
}
