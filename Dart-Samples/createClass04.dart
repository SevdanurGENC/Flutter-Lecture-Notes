
class Insan{
  String? isim;
  int? yas;
  double? kilo;
  
  //Insan({String isimGiris = "Huseyin", int yasGiris = 30, double kiloGiris = 56.6}){
  //  isim = isimGiris;
  //  yas = yasGiris;
  //  kilo = kiloGiris;
  //}
  
  Insan.deneme(){
    isim = "deneme";
    yas = 0;
    kilo = 0.0;
  }
  
  void kendiniTanit(){
    print("Merhaba, ben ${this.isim}");
  }
  
  
}

void main() {
 Insan kisi = Insan.deneme();
  print(kisi.isim);
  print(kisi.kilo);
  print(kisi.yas);
  kisi.kendiniTanit();
  
}
