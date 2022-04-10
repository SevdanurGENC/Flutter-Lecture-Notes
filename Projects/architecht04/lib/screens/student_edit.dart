import 'package:flutter/material.dart';
import 'package:architecht04/modules/student.dart';
import 'package:architecht04/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  //const StudentEdit({Key? key}) : super(key: key);
  Student? selectedStudents;

  StudentEdit(Student selectedStudents){
    this.selectedStudents = selectedStudents;
  }

  @override
  _StudentEditState createState() {
    return _StudentEditState(selectedStudents!);
  }
}

class _StudentEditState extends State<StudentEdit> with StudentValidationMixin {
  Student? selectedStudents;

  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudents){
    this.selectedStudents = selectedStudents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayit Guncelleme Ekrani"),
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
      initialValue: selectedStudents?.firstName,
      decoration: InputDecoration(
        labelText: "Ogrencinin Adi : ",
        hintText: "XXXXX",
      ),
      validator: validateFirstName,
      onSaved: (String? value){
        selectedStudents?.firstName = value;
      },
    );
 }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudents?.lastName,
      decoration: InputDecoration(
        labelText: "Ogrencinin Soyadi : ",
        hintText: "XXXXX"
      ),
      validator: validateLastName,
      onSaved: (String? value){
        selectedStudents?.lastName = value;
      },
    );
  }

 Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudents?.grade.toString(),
      decoration: InputDecoration(
        labelText: "Ogrencinin Notu : ",
        hintText: "100"
      ),
      validator: validateGrade,
      onSaved: (String? value){
        selectedStudents?.grade = int.parse(value!);
      },
    );
 }

 Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Guncelle"),
        onPressed: (){
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          saveStudent();
          Navigator.pop(context);
        }
        }
    )
    ;
 }

  void saveStudent() {
    print(selectedStudents?.firstName);
    print(selectedStudents?.lastName);
    print(selectedStudents?.grade);
  }
}
