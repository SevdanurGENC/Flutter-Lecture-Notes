import 'package:architecht07/models/cart.dart';
import 'package:architecht07/blocs/cart_bloc.dart';
import 'package:architecht07/blocs/product_bloc.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlisVeris Ekrani"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.add_shopping_cart)
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot){
          return (snapshot.data is List)
              ? buildProductListItem(snapshot)
              : Center(
            child: Text("Veri bulunmamaktadir..."),
          );
        }
    );
  }

  buildProductListItem(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index){
        var list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: (){
              cartBloc.addToCart(Cart(list[index],1));
            },
          ),

        );
        }

    );

  }
}
