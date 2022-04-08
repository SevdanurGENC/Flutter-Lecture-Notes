
void fonksiyon1(){
  print("Birinci Fonksiyon");
  
}

Future fonksiyon2() async{
  await null;
  for(int i=0; i<100000000; i++);
  print("Asenkron tanimli fonksiyon 2");
}

void fonksiyon3(){
  print("Ucuncu fonksiyon");
}

void main() {
  fonksiyon1();
  fonksiyon2();
  fonksiyon3(); 
  
}
