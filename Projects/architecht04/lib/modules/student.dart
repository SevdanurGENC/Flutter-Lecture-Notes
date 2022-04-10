class Student{
  int? id;
  String? firstName;
  String? lastName;
  int? grade;
  String? status;

  Student.withId(int id, String firstName, String lastName, int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutId(){

  }

  String get getFirstName{
    return "Ogr - " + firstName!;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

  String get getStatus{
    String message = "";
    if(this.grade! >= 50){
      message = "Gecti";
    }else if(this.grade! >= 40){
      message = "Butulunmeye kaldi";
    } else{
      message = "Kaldi";
    }
    return message;
  }



}