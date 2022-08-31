import 'package:flutter/material.dart';

import '../blocs/cart_bloc.dart';
import '../blocs/product_bloc.dart';
import '../models/cart.dart';
import '../models/product.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: ProductBloc().getAll(),
      stream: ProductBloc().getStream,
      builder: (context, snapshot) {
        return snapshot.hasData == true
            ? buildProductListItem(snapshot)
            : Center(
                child: Text("data yok"),
              );
      },
    );
  }

  buildProductListItem(AsyncSnapshot<Object?> snapshot) {
    final list = snapshot.data as List<Product>;
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                CartBloc().addToCart(Cart(list[index], 1));
              },
            ),
          );
        });
  }
}
