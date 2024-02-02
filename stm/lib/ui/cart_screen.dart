import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stm/business/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management: Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.items[index].name),
                subtitle: Text('\$${cart.items[index].price}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).removeFromCart(cart.items[index]);
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