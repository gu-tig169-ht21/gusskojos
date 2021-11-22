import 'package:flutter/material.dart';
import 'package:todo_app/providers/todolist.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todolist_builder.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        elevation: 0,
        actions: [_popUpFilterButton(context)],
      ),
      body: Consumer<TodoListProvider>(builder: (context, state, child) {
        return TodoListBuilder(
            list: state.filterList(state.todoList, state.filterBy));
      }),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _popUpFilterButton(context) {
    var state = Provider.of<TodoListProvider>(context, listen: false);
    return PopupMenuButton(
        onSelected: (int value) {
          state.setFilterby(value);
        },
        itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Visa alla'), value: 1),
              const PopupMenuItem(child: Text('Gjorda'), value: 2),
              const PopupMenuItem(child: Text('Att göra'), value: 3)
            ]);
  }

  Widget _floatingActionButton(context) {
    return FloatingActionButton(
      onPressed: () async {
        dynamic item = await Navigator.pushNamed(context, '/add');
        if (item != null) {
          Provider.of<TodoListProvider>(context, listen: false).addItem(item);
        }
      },
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    );
  }
}
