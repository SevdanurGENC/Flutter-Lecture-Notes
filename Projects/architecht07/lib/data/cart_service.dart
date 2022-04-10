import 'package:architecht07/models/cart.dart';

class CartService {
  static List<Cart> cartItems = <Cart>[];

  CartService._internal();

  static CartService _singleton = CartService._internal();

  factory CartService(){
    return _singleton;
  }

  static void addToCart(Cart item){
    cartItems.add(item);
  }

  static void removeFromCart(Cart item){
    cartItems.remove(item);
  }

  static List<Cart> getCart(){
    return cartItems;
  }
}