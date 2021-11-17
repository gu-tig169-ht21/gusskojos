class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, this.done = false});

  void toggleCompleted(item) {
    done = !done;
  }
}
