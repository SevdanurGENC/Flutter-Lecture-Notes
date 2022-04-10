import 'package:flutter/material.dart';
import 'package:architecht02/pages/secondpage.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        centerTitle: true,

      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ikinci Sayfaya Gecin"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondRoute())
            );
          },
        ),
      ),
    );
  }
}
