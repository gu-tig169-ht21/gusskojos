import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:todo_app/models/todoitem.dart';

//Todo : Add try Catch

class TodoService {
  Future<List<TodoItem>> fetchTodos() async {
    try {
      print('Fetch Ran');
      final Response response = await get(Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=291dd6d6-a184-4613-b365-4d5ce24bd913'));
      return parseJson(response);
    } on SocketException {
      throw Failure(message: 'No Internet connection 😑');
    } on HttpException {
      throw Failure(message: "Couldn't find todos 😱");
    } on FormatException {
      throw Failure(message: "Bad response format 👎");
    }
  }

  Future<List<TodoItem>> postTodo(TodoItem item) async {
    Response response = await post(
        Uri.parse(
            'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=291dd6d6-a184-4613-b365-4d5ce24bd913'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(item));
    return parseJson(response);
  }

  Future<List<TodoItem>> deleteTodoItem(TodoItem item) async {
    Response response = await delete(Uri.parse(
        'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=291dd6d6-a184-4613-b365-4d5ce24bd913'));
    return parseJson(response);
  }

  Future<List<TodoItem>> updateTodo(TodoItem item) async {
    Response response = await put(
        Uri.parse(
            'https://todoapp-api-pyq5q.ondigitalocean.app/todos/${item.id}?key=291dd6d6-a184-4613-b365-4d5ce24bd913'),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(item));
    return parseJson(response);
  }

//Function to parse Json response to TodoItem
  List<TodoItem> parseJson(response) {
    List<dynamic> parsedList = jsonDecode(response.body);
    List<TodoItem> itemsList =
        List<TodoItem>.from(parsedList.map((i) => TodoItem.fromJson(i)));
    return itemsList;
  }
}

class Failure {
  final String message;

  Failure({this.message = ""});

  @override
  String toString() => message;
}
