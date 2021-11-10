import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/add_todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //En statisk todo-lista för att generera Todo-items
  List<String> todo = [
    'Städa',
    'Plugga',
    'Chilla',
    'Handla mat',
    'Flutter YT',
    'Skriva lite kod',
    'Städa',
    'Träna',
    'Diska'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        elevation: 0,
        actions: const [
          // ignore: todo
          /* TODO: implementeras senare
            PopupMenuButton()
          */
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
          // Marginal som gör Container listan lite lägre i höjd
          margin: const EdgeInsets.only(bottom: 110),
          child: _listBuilder()),
    );
  }

  //Returnerar en Todo-lista med Todo items.
  Widget _listBuilder() {
    return ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return _item(index);
        });
  }

  //Widget som returnerar ett CardItem till todo-listan
  Widget _item(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
      child: Card(
        margin: const EdgeInsets.only(top: 3),
        child: ListTile(
          leading: Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          trailing: const Icon(Icons.delete),
          title: Text(todo[index],
              style: GoogleFonts.handlee(
                  textStyle: const TextStyle(fontSize: 20))),
        ),
      ),
    );
  }
}
