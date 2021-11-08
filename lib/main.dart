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

  var list = ['Städa', 'Plugga', 'Chilla', 'Handla mat'];

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
    );
  }
}

Widget _item(text) {
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
