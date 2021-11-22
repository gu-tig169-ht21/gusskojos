class TodoItem {
  String title;
  bool isCompleted;

  TodoItem({required this.title, this.isCompleted = false});

  void toggleCompleted(item) {
    isCompleted = !isCompleted;
  }
}
