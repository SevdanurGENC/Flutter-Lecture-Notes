void main() {
  merhaba();
  print(sayi());  
  print(topla(9,29));
  print(carp(5));
  print(carpim(sayi1:10, sayi2:42));
  print(ekle(7,29));
  print("3 + 5 'in sonucu = ${topla(3,5)}");
  String isim = "Mert";
  print("Sisteme hosgeldiniz : ${isim} !!!");

}

int ekle(int sayi1, int sayi2) => sayi1 + sayi2;

int carpim({required int sayi1, required int sayi2}){
  return sayi1*sayi2;
}

int carp(int a, [int b = 2]){
  return a* b;
}

void merhaba(){
  print("Sisteme Hosgeldiniz...");
}

int sayi(){
  return 100;
}

int topla(int sayi1, int sayi2){
  return sayi1+sayi2;
}

