import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Lägg till Todo'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _addItem(),
    );
  }
}

Widget _addItem() {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TextField(
            maxLength: 40,
            decoration: InputDecoration(
                label: Text(
                  'Lägg till Todo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                alignLabelWithHint: true,
                hintText: 'Gå ut med hunden',
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
        ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text(
              'Skapa Todo',
              style: TextStyle(color: Colors.blueGrey[00]),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Colors.green,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ],
    ),
  );
}
