class Insan{
  String? isim;
  int? yas;
  double? kilo;
  
  Insan(String i, int y, double k){
    this.isim = i;
    this.yas = y;
    this.kilo = k;    
  }
}

class Calisan extends Insan{
  double? maas;
  
  Calisan(isim, yas, kilo, this.maas):super(isim, yas, kilo);
  
  kendiniTanit(){
    print("Isim : ${isim}");
    print("Yas : ${yas}");
    print("Kilo : ${kilo}");
    print("Maas : ${maas}");
  }
  
}


void main() {
  Calisan kisi = Calisan("Kaan", 25, 89.09, 3500.40);
  kisi.kendiniTanit();
  
}
