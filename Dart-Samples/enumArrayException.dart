enum Durum{
    none,
    calisiyor,
    durmus, 
    bitmis
  }

void main() {
  var dizi = ['a','b','c', 'd', 'e'];
  //print(dizi);  
  //print(dizi.first);
  //print(dizi.last);
  //print(dizi.isEmpty);
  //print(dizi.isNotEmpty);
  
  //print(Durum.values);
  
  //Durum.values.forEach((veri) => print("Index No : ${veri.index} , Veri : ${veri.name}"));
  
  //print("Calisiyor : ${Durum.calisiyor}, ${Durum.calisiyor.index}");
  //print("Calisiyor index : ${Durum.values[2]}");
  
  //try-on-catch-throw-finally
  
  
  int sayi1 = 100;
  int sayi2 = 0;
  int bolum;
  
  try{
    bolum = sayi1 ~/ sayi2;
    print(bolum);
  }
  catch(e){
    print("Hata olustu, bir sayi sifira bolunemez!!!!");
    //print(e.toString());
  }
  finally{
    print("Hata olsun ya da olmasin her halukarda burasi calisir...");
  }
  
  
  
}
