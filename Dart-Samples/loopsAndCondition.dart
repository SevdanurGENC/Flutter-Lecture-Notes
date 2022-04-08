void main() {
  for (int i = 0; i < 5; i++) {
    //print('hello ${i + 1}');
  }
  
  for (var i = 0; i < 10; i++) {
    //print(i);
  }
  
  List isimler = ["Ali", "Cengiz", "Huseyin", "Hakan"];
  //print(isimler);
  
  for(var degisken in isimler){
    //print(degisken);
  }
  
  isimler.forEach((degisken) {
    //print(degisken);
  });
  
  int i = 10;
  while(i != 0){
    //print(i);
    i--;
  }
  
  int k = 10;
  do{
    //print(k);
    k--;
  }while(k != 0);
  
  int m = 5;
  if (m==9){
    print("m 5'e esittir");
  }else {
    print("m 5'e esit degildir");
  }
  
  int t = 5;
  if(t==5){
    print("t 5'e esittir");
  }else if(t==3){
    print("t 3'e esittir");
  }else{
    print("t'nin degeri bilinmiyor");
  }
  
  int x = 7;
  
  switch(x){
    case 0: 
      print("x'in degeri 0'dir");
      break;
    case 7:
      print("x'in degeri 7'dir");
      break;
    case 15: 
      print("x'in degeri 15'dir");
      break;
    default:
      print("x'in degeri bilinmiyor");
  }
  
}
