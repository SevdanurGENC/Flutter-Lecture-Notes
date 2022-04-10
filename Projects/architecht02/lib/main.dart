import 'package:flutter/material.dart';
import 'package:architecht02/pages/firstScreen.dart';
import 'package:architecht02/pages/SecondScreen.dart';

void main(){
  runApp(MaterialApp(
    title: "Navigator Kullanimi",
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => FirstScreen(),
      '/ikinciSayfa' : (context) => SecondScreen(),
    },

    theme: ThemeData.dark(),
  ));
}