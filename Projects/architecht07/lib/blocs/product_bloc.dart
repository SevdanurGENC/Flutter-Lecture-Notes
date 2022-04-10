import 'dart:async';

import 'package:architecht07/models/product.dart';
import 'package:architecht07/data/product_service.dart';

final productBloc = ProductBloc();

class ProductBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Product> getAll(){
    return ProductService.getAll();
  }
}