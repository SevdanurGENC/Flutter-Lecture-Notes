import 'package:architecth03/pages/listedetay.dart';
import 'package:architecth03/pages/todo.dart';
import 'package:flutter/material.dart';
import 'package:architecth03/pages/listedetay.dart';

class TodoScreen extends StatelessWidget {
  final List<Todo> todos;
  const TodoScreen({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeler"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(todo : todos[index] )));
            },
          );
          }),

    );
  }
}
