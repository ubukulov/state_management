import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr/business/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget  {

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final cartItems = watch(cartProvider);

    return ProviderScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text('flutter_riverpod: Cart'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.name),
                subtitle: Text('${cartItem.price.toString()} \$'),
                trailing: ElevatedButton(
                  onPressed: () {
                    context.read(cartProvider.notifier).removeFromCart(cartItem);
                  },
                  child: const Text('Remove'),
                ),
              );
            },
          ),
      ),
    );
  }
}