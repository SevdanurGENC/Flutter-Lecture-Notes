import 'package:flutter/material.dart';
import 'package:architecht06/models/car.dart';
import 'package:architecht06/utils/dbhelper.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  List<Car> cars = [];
  List<Car> carsByName = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();
  TextEditingController idDeleteController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message){
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Insert"),
                Tab(text: "View",),
                Tab(text: "Query",),
                Tab(text: "Update",),
                Tab(text: "Delete",),
              ],
            ),
            title: Text("Cars Database With SQLite"),
          ),

          body: TabBarView(
            children: [
             Center(
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.all(20),
                     child: TextField(
                       controller: nameController,
                       decoration: InputDecoration(
                         labelText: "Car Name",
                         border: OutlineInputBorder()
                       ),
                     ),
                   ),
                   Container(
                     padding: EdgeInsets.all(20),
                     child: TextField(
                       controller: milesController,
                       decoration: InputDecoration(
                         labelText: "Car Miles",
                         border: OutlineInputBorder()
                       ),
                     ),
                   ),
                   RaisedButton(
                     child: Text("Insert Car Details"),
                       onPressed: (){
                       String name = nameController.text;
                       int miles = int.parse(milesController.text);
                       _insert(name,miles);
                       }
                   )
                 ],
               ),
             ),
             Container(
               child: ListView.builder(
                 padding: const EdgeInsets.all(8),
                   itemCount: cars.length + 1,
                   itemBuilder: (BuildContext context, int index) {
                    if(index == cars.length){
                      return RaisedButton(
                        child: Text("Refresh"),
                          onPressed: (){
                          setState(() {
                            _queryAll();
                          });
                          }
                      );
                    }
                    return Container(
                      height: 40,
                      child: Center(
                        child: Text(
                            '[${cars[index].id}] ${cars[index].name} - ${cars[index].miles} miles',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                   }

               ),
             ),
             Center(
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.all(20),
                     child: TextField(
                       controller: queryController,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: "Car Name : "
                       ),
                       onChanged: (text){
                         if(text.length >=2){
                           setState(() {
                             _query(text);
                           });
                         } else {
                           setState(() {
                             carsByName.clear();
                           });
                         }
                       },
                     ),
                     height: 100,
                   ),
                   Expanded(
                       child: Container(
                         height: 300,
                         child: ListView.builder(
                           padding: const EdgeInsets.all(8),
                             itemCount: carsByName.length,
                             itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 50,
                                margin: EdgeInsets.all(2),
                                child: Center(
                                  child: Text(
                                    '[${carsByName[index].id}] ${carsByName[index].name} - ${carsByName[index].miles} miles',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              );
                             }
                         ),
                       )
                   )
                 ],
               ),
             ),
             Center(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Container(
                       padding: EdgeInsets.all(20),
                       child: TextField(
                         controller: idUpdateController,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Car ID : "
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.all(20),
                       child: TextField(
                         controller: nameUpdateController,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Car Name : "
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.all(20),
                       child: TextField(
                         controller: milesUpdateController,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Car Miles : "
                         ),
                       ),
                     ),
                     RaisedButton(
                       child: Text("Update Car Details"),
                         onPressed: (){
                          int id = int.parse(idUpdateController.text);
                          String name = nameUpdateController.text;
                          int miles = int.parse(milesUpdateController.text);
                          _update(id, name, miles);
                         }
                     )
                   ],
                 ),
               ),
             ),
             Center(
               child: Column(
                 children: [
                   Container(
                     padding: EdgeInsets.all(20),
                     child: TextField(
                       controller: idDeleteController,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: "Car ID : "
                       ),
                     ),
                   ),
                   RaisedButton(
                       child: Text("Delete"),
                       onPressed: (){
                         int id = int.parse(idDeleteController.text);
                         _delete(id);
                       }
                       )
                 ],
               ),
             )
            ],
          ),
        ),
    );
  }

  void _insert(name,miles) async{
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : name,
      DatabaseHelper.columnMiles : miles
    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold("Inserted Row ID : $id");
  }

  void _queryAll() async{
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold("Query Done !!!");
    setState(() {});
  }

  void _query(text) async {
    final allRows = await dbHelper.queryRow(text);
    carsByName.clear();
    allRows.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  void _update(int id, String name, int miles) async{
    Car car = Car(id, name, miles);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold("Updated $rowsAffected row(s)");
  }

  void _delete(int id) async{
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold("Deleted $rowsDeleted row(s) : row $id");
  }
}
