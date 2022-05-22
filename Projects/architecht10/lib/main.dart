import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double latitudeInfo = 0.0; //enlem
  double longitudeInfo = 0.0; //boylam

  Future<void> getLocation() async{

    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever){
        return Future.error("Location Not Available");
      }
    } else {
      throw Exception("Error");
    }

    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeInfo = double.parse(konum.latitude.toStringAsFixed(3));
      longitudeInfo = double.parse(konum.longitude.toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Info APP"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Latitude INFO : $latitudeInfo",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "Longitude INFO : $longitudeInfo",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: getLocation,
                child: Text("Get Location"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
            )
          ],
        ),
      ),
    );
  }
}
