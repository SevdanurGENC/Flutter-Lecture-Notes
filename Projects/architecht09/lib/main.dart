import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/anasayfa.dart';
import 'screens/kayitekrani.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp((Yapilacaklar()));

}

class Yapilacaklar extends StatelessWidget {
  const Yapilacaklar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, kullaniciVerisi){
          if(kullaniciVerisi.hasData)
            return AnaSayfa();
          else
            return KayitEkrani();
        },
      ),
    );
  }
}
