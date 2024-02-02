import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr/ui/cart_screen.dart';
import 'package:fr/business/providers/product_provider.dart';
import 'package:fr/business/providers/cart_provider.dart';

class ProductsScreen extends ConsumerWidget  {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final products  = watch(productProvider);
    final cartItems = watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter_riverpod'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
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
          )
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
            )
    );
  }
  
}