import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int sayac = 0;
  Future<void> sayacKontrol() async{
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac = sayac+1;
    });

    sp.setInt("sayac", sayac);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayacKontrol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayac Uygulamasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Acilis Sayisi : $sayac",
            style: TextStyle(fontSize: 40),)
          ],
        ),
      ),
    );
  }
}
