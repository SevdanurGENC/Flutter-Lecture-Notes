import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.lightBlue),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final gunler = [
      "pazartesi",
      "sali",
      "carsamba",
      "persembe",
      "cuma"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Sisteme Hosgeldiniz..."),
        centerTitle: true,

      ),
      body: ListView.builder(
        itemCount: gunler.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(gunler[index]) ,
          );
          }

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("Butona basildi...");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ) ,
        splashColor: Colors.red,
        backgroundColor: Colors.blue,
        tooltip: "Tiklayiniz",
        child: Icon(Icons.add_call),
      ),

    );
  }
}
