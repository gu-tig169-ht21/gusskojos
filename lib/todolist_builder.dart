import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todoitem.dart';
import 'package:todo_app/providers/todolist.dart';

class TodoListBuilder extends StatelessWidget {
  const TodoListBuilder({Key? key, required this.list}) : super(key: key);

  final List<TodoItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(context, list[index]);
        });
  }
}

Widget _item(context, TodoItem item) {
  //Get State from provider
  var state = Provider.of<TodoListProvider>(context, listen: false);
  return Padding(
    padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
    child: Card(
        margin: const EdgeInsets.only(top: 3),
        child: CheckboxListTile(
          title: Text(item.title),
          secondary: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.grey[900],
              ),
              onPressed: () {
                state.deleteItem(item);
              }),
          controlAffinity: ListTileControlAffinity.leading,
          value: item.isCompleted,
          onChanged: (value) {
            state.isCompleted(item);
          },
        )),
  );
}