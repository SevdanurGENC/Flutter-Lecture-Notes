import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GorevEkle extends StatefulWidget {
  const GorevEkle({Key? key}) : super(key: key);

  @override
  State<GorevEkle> createState() => _GorevEkleState();
}

class _GorevEkleState extends State<GorevEkle> {

  TextEditingController adAlici = TextEditingController();
  TextEditingController tarihAlici = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorev Ekle Ekrani"),
      ) ,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: adAlici,
              decoration: InputDecoration(
                labelText: "Gorev Adi : ",
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: tarihAlici,
              decoration: InputDecoration(
                labelText: "Son Tarih : ",
                border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 70,
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Gorevi Ekle", style: TextStyle(fontSize: 24),),
              onPressed: (){
                verileriEkle();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
            ),
          )
        ],
      ),

    );
  }

  void verileriEkle() async {
    FirebaseAuth yetki = FirebaseAuth.instance;
    var mevcutKullanici = await yetki.currentUser;

    String uidTutucu = mevcutKullanici!.uid;
    var zamanTutucu = DateTime.now();

    await FirebaseFirestore.instance
    .collection('Gorevler')
    .doc(uidTutucu)
    .collection('Gorevlerim')
    .doc(zamanTutucu.toString())
    .set({
      'ad' : adAlici.text,
      'sonTarih' : tarihAlici.text,
      'zaman' : zamanTutucu.toString(),
      'tamZaman' : zamanTutucu
    });

    Fluttertoast.showToast(msg: "Gorev Basariyla Eklenmistir.");
  }
}
