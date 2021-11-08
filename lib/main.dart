import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
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
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterView()));
            },
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 2),
          child: _list()),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10, left: 300, bottom: 10),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => print('Add button was pressed')),
      ),
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

  return ListView.builder(
    itemBuilder: (context, index) => _item(text: list[index]),
    itemCount: list.length,
  );
}

Widget _item({required text}) {
  return ListTile(
    leading: const Icon(Icons.check_box_outline_blank_rounded),
    title: Text(text),
    trailing: const Icon(Icons.close),
  );
}

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  final String appBarTitle = 'TIG169 TODO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
    );
  }
}
