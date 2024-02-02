import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fmobx/data/cart_store.dart';

class CartScreen extends StatelessWidget {
  final CartStore cartStore;

  const CartScreen({Key? key, required this.cartStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_mobx: cart'),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: cartStore.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartStore.cartItems[index];
              return ListTile(
                title: Text(cartItem.product.name),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    cartStore.removeFromCart(cartItem);
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