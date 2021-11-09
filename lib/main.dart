import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 ToDo App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final String appBarTitle = 'TIG169 TODO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Visa alla')),
                    PopupMenuItem(child: Text('Gjorda')),
                    PopupMenuItem(child: Text('Att göra'))
                  ])
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 100),
          child: _list()),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[700],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddView()));
          }),
      backgroundColor: Colors.blueGrey[50],
    );
  }
}

Widget _list() {
  //Static Todo list for UI purpose
  var list = [
    'Städa',
    'Plugga',
    'Chilla',
    'Handla mat',
    'Flutter YT',
    'Skriva lite kod',
    'Städa',
    'Plugga',
    'Chilla',
    'Handla mat',
    'Flutter YT',
    'Skriva lite kod'
  ];
/*
  return ListView.builder(
    itemBuilder: (context, index) => _item(text: list[index]),
    itemCount: list.length,
  );
  */
  return ListView.separated(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return _item(list[index]);
    },
    separatorBuilder: (context, index) {
      return const Divider(
        thickness: 1.1,
        color: Colors.black26,
      );
    },
  );
}

Widget _item(text) {
  return ListTile(
    leading: const Icon(Icons.check_box_outline_blank_rounded),
    title: Text(
      text,
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.black, fontSize: 20)),
    ),
    trailing: const Icon(Icons.close),
  );
}

class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  final String appBarTitle = 'TIG169 TODO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: _addItem(),
    );
  }

  Widget _addItem() {
    return Container(
      margin: EdgeInsets.all(30),
      height: 200,
      child: Column(
        children: [
          const TextField(
            maxLength: 40,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Vad skall du göra?'),
          ),
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
}
