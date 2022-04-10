import 'package:architecht04/modules/student.dart';
import 'package:architecht04/screens/student_add.dart';
import 'package:architecht04/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Ogrenci Bilgi Sistemi";
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Ali", "Cengiz", 100),
    Student.withId(2, "Fatma", "Ceylan", 39),
    Student.withId(3, "Ayse", "Yilmaz", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: buildBody(context),
    );
  }

 Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: students.length,
                itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://cdnuploads.aa.com.tr/uploads/sirkethaberleri/Contents/2019/07/18/thumbs_b_c_e423b2a328d8031f6c919366f70886c3.jpg"),
                  ),
                  title: Text(students[index].firstName! + " " +
                  students[index].lastName!),
                  subtitle: Text("Sinavdan aldigi not : " +
                  students[index].grade.toString() + " [ " +
                  students[index].getStatus + " ] "),
                  trailing: buildStatusIcon(students[index].grade!),
                  onTap: (){
                    setState(() {
                      print(selectedStudent.firstName!+" "+selectedStudent.lastName!);
                      selectedStudent = students[index];
                    });
                  },
                );
                },
            ),
        ),
        Text("Secili Ogrenci : " + selectedStudent.firstName! + " " +
            selectedStudent.lastName!),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0),
                      Text("Yeni Kayit"),
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));

                  },
                )
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(children:
                [
                  Icon(Icons.update),
                  SizedBox(width: 5.0,),
                  Text("Kayit Guncelle")],
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent))
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Sil"),
                      ]
                  ),
                  onPressed: (){
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var mesaj = selectedStudent.firstName! + " Silindi.";
                    mesajGonder(context, mesaj);
                  },
                )
            ),
          ],
        ),
      ],
    );
 }

 Widget buildStatusIcon(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }else if(grade>=40){
      return Icon(Icons.alarm);
    }else{
      return Icon(Icons.clear);
    }

 }

  void mesajGonder(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Islem sonucunuz : "),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
