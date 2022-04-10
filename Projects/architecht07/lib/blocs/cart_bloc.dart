import 'dart:async';

import 'package:architecht07/data/cart_service.dart';
import 'package:architecht07/models/cart.dart';

final cartBloc = CartBloc();

class CartBloc{
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }

}