import 'package:architecth03/pages/liste.dart';
import 'package:architecth03/pages/todo.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayfalar Arasi Veri Tasima',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TodoScreen(
        todos: List.generate(20, (i) => Todo("Liste Elemani $i",
            "Liste Elemani icin yapilmasi gereklenrin aciklamasi $i")),

      ),
    );
  }
}
