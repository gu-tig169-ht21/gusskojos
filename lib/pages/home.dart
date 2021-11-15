import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/add_todo.dart';
import 'package:todo_app/models/todoitem.dart';
import 'package:todo_app/providers/todolist.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Visa alla'),
                      onTap: () {},
                    ),
                    PopupMenuItem(child: Text('Gjorda'), onTap: () {}),
                    PopupMenuItem(child: Text('Att göra'), onTap: () {})
                  ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic item = await Navigator.pushNamed(context, '/add');
          if (item != null) {
            Provider.of<TodoListProvider>(context, listen: false).addItem(item);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TodoListProvider>(
          builder: (context, state, child) => CardList(list: state.list)),
    );
  }
}

class CardList extends StatelessWidget {
  CardList({Key? key, required this.list}) : super(key: key);
  final List<ItemCard> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _item(context, item)).toList());
  }
}

//Returnerar en Todo-lista med Todo items.
/* Widget _listBuilder() {
    //int count = context.read()
    return ListView.builder(
        itemCount: context.read<Items>(),
        itemBuilder: (context, index) {
          return _item(index);
        });
  }*/

//Widget som returnerar ett CardItem till todo-listan

Widget _item(context, ItemCard item) {
  var state = Provider.of<TodoListProvider>(context, listen: false);

  return Padding(
    padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
    child: Card(
        margin: const EdgeInsets.only(top: 3),
        child: CheckboxListTile(
          title: Text(item.title),
          secondary: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                var state =
                    Provider.of<TodoListProvider>(context, listen: false);
                state.deleteItem(item);
              }),
          controlAffinity: ListTileControlAffinity.leading,
          value: item.isCompleted,
          onChanged: (value) {
            var state = Provider.of<TodoListProvider>(context, listen: false);
            state.isCompleted(item);
          },
        )),
  );
}
