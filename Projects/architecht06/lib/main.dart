import 'package:architecht06/screens/myhomepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SQLite Demo",
      theme: ThemeData.dark(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
