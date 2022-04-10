class StudentValidationMixin{

  String? validateFirstName(String? value){
    if (value == null){
      return "kontrol ediliyor";
    }
    if (value.length<2){
      return "Isim bilgisi en az 2 karakter olmalidir";
    }
  }

  String? validateLastName(String? value){
    if(value==null){
        return "kontrol ediliyor";
      }
    if(value.length<2){
      return "Soyisim bilgisi en az 2 karakter olmalidir.";
    }
  }

  String? validateGrade(String? value){
    if (value == null){
      return "kontrol ediliyor";
    }
    var grade = int.parse(value);
    if(grade <0 || grade >100){
      return "0-100 arasi not girisi yapilmamalidir.";
    }
  }


}