import 'package:architecht08/screens/cat_breeds.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Json Parse",
      theme: ThemeData.dark(),
      home: CatBreedsPage(title: "Cat Breeds"),
      debugShowCheckedModeBanner: false,
    );
  }
}
