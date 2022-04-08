class Hesaplama_Toplam{
  int? toplam() {}
}

class Hesaplama_Indirim{
  int? indirim() {}
}

class Hesap implements Hesaplama_Toplam, Hesaplama_Indirim{
  int toplam(){
    return 1000;
  }
  
  int indirim(){
    return 50;
  }
}

void main() {
  Hesap hsp = new Hesap();
  print("Brut Toplam : ${hsp.toplam()}");
  print("Indirim : ${hsp.indirim()}");
}
