import 'dart:convert';
import 'package:http/http.dart';
import 'package:todo_app/models/todoitem.dart';

class TodoService {
  static Future<List<TodoItem>> fetchTodos() async {
    //Response as a String
    final Response response = await get(Uri.parse(
        'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=291dd6d6-a184-4613-b365-4d5ce24bd913'));

    //Convert String to JsonObject
    var data = jsonDecode(response.body);
    List<TodoItem> todoList = [];

    for (var obj in data) {
      bool done;

      if (obj['done'] == "true") {
        done = true;
      } else {
        done = false;
      }

      TodoItem item = TodoItem(
        id: obj['id'],
        title: obj['title'],
        done: done,
      );
      todoList.add(item);
    }

    return todoList;
  }

  static Future<List<TodoItem>> postTodo(TodoItem item) async {
    Response response = await post(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=291dd6d6-a184-4613-b365-4d5ce24bd913'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'title': item.title, 'done': item.done}),
    );

    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> itemsList =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return itemsList;
  }

  static Future<void> deleteTodoItem(TodoItem item) async {
    Response response = await delete(Uri.parse(
        'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=291dd6d6-a184-4613-b365-4d5ce24bd913'));
    print('Item deletet');
  }

  static Future<List<TodoItem>> updateTodo(TodoItem item) async {
    Response response = await put(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=291dd6d6-a184-4613-b365-4d5ce24bd913'),
      headers: {'Content-Type': "application/json"},
      body: json.encode({'title': item.title, 'done': item.done}),
    );

    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> itemsList =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return itemsList;
  }
}
