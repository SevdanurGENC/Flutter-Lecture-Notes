import 'package:flutter/material.dart';
import 'kayitformu.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayit Ekrani"),
        centerTitle: true,
      ) ,
      body: KayitFormu(),
    );
  }
}
