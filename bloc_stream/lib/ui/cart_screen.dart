import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_stream/business/blocs/cart_bloc.dart';
import 'package:bloc_stream/business/models/product.dart';

import '../business/models/cart.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final cartBloc = Provider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: cartBloc.cartItemsStream,
        builder: (context, snapshot) {
          final cartItems = snapshot.data!;
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.name),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cartBloc.addToCart(cartItem);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

}