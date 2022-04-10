import 'package:architecth03/pages/todo.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;
  const DetailsScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),

      ) ,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ) ,
    );
  }
}
