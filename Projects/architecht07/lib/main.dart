import 'package:flutter/material.dart';
import 'package:architecht07/screens/cart_screen.dart';
import 'package:architecht07/screens/product_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (BuildContext context) => ProductListScreen(),
        "/cart" : (BuildContext context) => CartScreen()
      },
    );
  }
}

