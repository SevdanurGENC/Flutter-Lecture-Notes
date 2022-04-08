void main() {
  Map isimler = {1 : "Sercan", 2 : "Yildiz", 3: "Ayse", 4: "Berkay"};
  print(isimler);
 
  
  Map cokBoyutluListeler = {
    1: {1 : "Sercan", 2 : "Yildiz", 3: "Ayse", 4: "Berkay"},
    2: {5: "Ali", 6: "Kemal", 7: "Cengiz", 8: "Nuri"},
    3: {9: "Kenan", 10: "Murat", 11: "Sule", 12: "Sinan"}
  };
  
  //print(cokBoyutluListeler);
  
  //print(cokBoyutluListeler[2]);
  //print(cokBoyutluListeler[2][5]);

  //print(isimler.isEmpty);
  //print(isimler.isNotEmpty);
  
  //print(isimler.keys);
  //print(isimler.values);
  
  //print(isimler.length);
  
  Map cokBoyutluListeIki = {
    4: {13: "Atilla", 14: "Onur", 15: "Oznur"},
    5: {16: "Eda", 17: "Buse", 18: "Melise"}
  };
  
  //cokBoyutluListeler.addAll(cokBoyutluListeIki);
  //print(cokBoyutluListeler);
  
  //isimler.clear();
  
  //print(cokBoyutluListeler[2].containsKey(10));
  //print(cokBoyutluListeler[1].containsValue("Nuri"));
  
  isimler.remove(2);
  print(isimler);
  
  cokBoyutluListeler.update(2, (value) => {5: "Recep", 6: "Nuri", 7: "Sila", 8: "Melisa"});
  print(cokBoyutluListeler);
  
  
}
