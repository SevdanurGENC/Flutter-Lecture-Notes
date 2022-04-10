import 'package:flutter/material.dart';
import 'package:architecht04/modules/student.dart';
import 'package:architecht04/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  //const StudentAdd({Key? key}) : super(key: key);

  List<Student>? students;
  StudentAdd(List<Student> students){
    this.students = students;
  }

  @override
  _StudentAddState createState() {
    return _StudentAddState(students!);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student>? students;

  var student = Student.withoutId();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ogrenci Kayit Ekrani"),
        centerTitle: true,
      ) ,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),

        ),
      ),
    );
  }

 Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ogrencinin Adi : ",
        hintText: "XXXXX",
      ),
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName = value;
      },
    );
 }

 Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ogrencinin Soyadi : ",
        hintText: "XXXXX",
      ),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastName = value;
      },
    );
 }

 Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Ogrencinin Notu : ",
        hintText: "100"
      ),
      validator: validateGrade,
      onSaved: (String? value){
        student.grade = int.parse(value!);
      },
    );
 }

 Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
        onPressed: (){
        if (formKey.currentState!.validate()){
          formKey.currentState!.save();
          students?.add(student);
          saveStudent();
          Navigator.pop(context);
        }
        }
    );
 }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
