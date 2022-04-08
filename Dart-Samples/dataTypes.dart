void main() {
  String yazi = "Bugun hava guzel";
  int sayi = 17;
  String turDonusumu = sayi.toString();
  double sayi1 = 15.23;
  int sayiTurDonusumu = sayi1.toInt();
  bool onlineMi = true; 
  //print(sayiTurDonusumu);
  //print(sayi1.runtimeType);
  //print(onlineMi);

  List isimler = ["Kastamonu", "Taskopru", 37];
  //print(isimler);
  
  Map kisi = {"isim" : "Ali", "Soyisim" : "Cengiz", "Yas" : 40};
  //print(kisi);
  
  //var - dynamic
  //var 
  var degisken1 = "metin";
  var degisken2 = 156;
  var degisken3 = false;
  
  print(degisken1);
  print(degisken2);
  print(degisken3);
  
  //dynamic
  dynamic degisken4 = "yildiz";
  dynamic degisken5 = 78;
  dynamic degisken6 = true;
  
  print(degisken4);
  print(degisken5);
  print(degisken6);
  
}
