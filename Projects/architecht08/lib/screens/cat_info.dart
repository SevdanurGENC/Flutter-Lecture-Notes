import 'dart:convert';
import 'package:architecht08/models/cats.dart';
import 'package:architecht08/api/cats_api.dart';
import 'package:flutter/material.dart';

class CatInfo extends StatefulWidget {
  final String? catBreed;
  final String? catId;
  CatInfo({this.catBreed, this.catId});

  //const CatInfo({Key? key}) : super(key: key);

  @override
  _CatInfoState createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {

  CatList catList = CatList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catBreed!),
      ),
      body: getCat()
    );
  }

  void getCatData() async {
    var catJson = await CatAPI().getCatBreed(widget.catId!);
    print(catJson);

    var catMap = json.decode(catJson);
    print(catMap);
    setState(() {
      catList = CatList.fromJson(catMap);
    });
  }

  Widget getCat() {
    var mediaSize = MediaQuery.of(context).size;
    if(catList == null || catList.breeds == null || catList.breeds!.length == 00){
      return Container();
    }

    return Center(
      child: Container(
        width: mediaSize.width,
        height: mediaSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(catList.breeds![0].url!),
            fit: BoxFit.contain,
          )
        ),
      ),
    );


  }
}
