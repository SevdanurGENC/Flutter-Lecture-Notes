
class Insan{
  String? kisiIsim;
  
  Insan(kisiIsim);
  
  void set isim(String k){
    this.kisiIsim = k;
  }
  
  String get isim{
    return kisiIsim.toString();
  }
}

void main() {
  Insan kisi = Insan("Ali Cengiz");
  print(kisi.isim);
  kisi.isim = "Ali Cengiz";
  print(kisi.isim);
  
  
}
