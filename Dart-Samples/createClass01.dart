
class Insan{
  String? isim;
  int? yas;
  double? kilo;
  
  //Insan(String isimGiris, int yasGiris, double kiloGiris){
  //  isim = isimGiris;
  //  yas = yasGiris;
  //  kilo = kiloGiris;
  //}
  
  //Insan(this.isim, this.yas, this.kilo);
  
  Insan({this.isim, this.yas, this.kilo});
  
  void kendiniTanit(){
    print("Merhaba, ben ${this.isim}");
  }
  
  
}

void main() {
 Insan kisi = Insan(isim:"Zeynep",yas: 20);
  print(kisi.isim);
  print(kisi.kilo);
  print(kisi.yas);
  kisi.kendiniTanit();
  
}
