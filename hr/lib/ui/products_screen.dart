import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hr/business/providers/product_provider.dart';
import 'package:hr/business/providers/cart_provider.dart';
import 'package:hr/ui/cart_screen.dart';


class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final products  = watch(productProvider);
    final cartItems = watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks_riverpod'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                    right: 1,
                    bottom: 10,
                    child: Text(
                        cartItems.length.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )
                    )
                )
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price.toString()} \$'),
            trailing: ElevatedButton(
              onPressed: () {
                context.read(cartProvider.notifier).addToCart(product);

                final snackBar = SnackBar(
                  content: Text('${product.name} added to cart.'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Закрыть',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}