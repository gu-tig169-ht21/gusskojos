import 'package:flutter/material.dart';
import 'package:todo_app/models/todoitem.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _textController = TextEditingController();
  bool inputIsEmpty = true;
//Set a dynamic Color on border
  Color getBorderColor() {
    if (inputIsEmpty) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  void submit() {
    TodoItem item = TodoItem(title: _textController.text);
    Navigator.pop(context, item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Lägg till Todo'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                    onChanged: (_textController) {
                      if (_textController.isNotEmpty) {
                        setState(() {
                          inputIsEmpty = false;
                        });
                      } else if (_textController.isEmpty) {
                        setState(() {
                          inputIsEmpty = true;
                        });
                      }
                    },
                    controller: _textController,
                    maxLength: 40,
                    decoration: InputDecoration(
                        label: const Text(
                          'Lägg till Todo',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: getBorderColor(), width: 2)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: getBorderColor(), width: 2),
                        ),
                        alignLabelWithHint: true,
                        hintText: 'Gå ut med hunden',
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: Text(
                      'Skapa Todo',
                      style: TextStyle(color: Colors.blueGrey[00]),
                    ),
                    onPressed: () {
                      if (_textController.text.isEmpty) {
                        print('Nothing to Save');
                        // TODO: ToastMessage
                      } else {
                        submit();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.green,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            )));
  }
}
