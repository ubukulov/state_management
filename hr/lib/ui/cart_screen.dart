import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hr/business/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cartItems = watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('hooks_riverpod: Cart'),
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
    );
  }
}