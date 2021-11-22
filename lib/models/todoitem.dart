class TodoItem {
  final String id;
  final String title;
  bool done;

  TodoItem({this.id = "", required this.title, required this.done});

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
        id: json['id'],
        title: json['title'],
        done: json['done'],
      );

  void toggleCompleted(item) {
    done = !done;
  }

  @override
  String toString() {
    return "{id: $id title: $title}";
  }
}
